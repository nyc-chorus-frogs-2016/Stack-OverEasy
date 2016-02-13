class Answer < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  belongs_to :question, touch: true
  belongs_to :responder, class_name: 'User'
  delegate :username, to: :responder, allow_nil: true

  def editable_by? user
    responder == user
  end

  def my_comments
    self.comments
  end

  def vote_count
    self.votes.sum(:value)
  end

  def recent_comments
    self.comments.order('created_at ASC')
  end

end
