class Question < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  has_many :answers
  belongs_to :questioner, class_name: 'User'

  def editable_by? user
    questioner == user
  end

  def best_answer
    Answer.find_by(id: self.best_answer_id)
  end

  def vote_count
    self.votes.sum(:value)
  end

  def recent_comments
    self.comments.order('created_at ASC')
  end

  # something about this sum isnt completely right just yet.???
  def self.by_points
    join_clause = 'left outer join votes on votes.votable_id = questions.id'
    joins(join_clause).group(:id).order('sum(votes.value) desc nulls last')
  end

  def self.recent_questions
    order('created_at DESC')
  end

  def self.by_trending
    order('updated_at DESC')
  end

end
