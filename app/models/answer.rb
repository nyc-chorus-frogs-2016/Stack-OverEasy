class Answer < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  belongs_to :question, touch: true
  belongs_to :responder, class_name: 'User'
  delegate :username, to: :responder, allow_nil: true

  def my_comments
    self.comments
  end

  def vote_count
    self.votes.sum(:value)
  end

  def recent_comments
    self.comments.order('created_at ASC')
  end

  def self.by_points
    join_clause = 'left outer join votes on votes.votable_id = answers.id'
    joins(join_clause).group(:id).order('sum(votes.value) desc nulls last')
  end

  def self.recent_answers
    order('created_at DESC')
  end

  def self.by_trending
    order('updated_at DESC')
  end

end
