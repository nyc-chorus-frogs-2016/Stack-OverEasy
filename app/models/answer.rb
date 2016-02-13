class Answer < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  belongs_to :question
  belongs_to :responder, class_name: 'User'
  delegate :username, to: :responder, allow_nil: true

  def my_comments
    self.comments
  end

  def vote_count
    self.votes.sum(:value)
  end

end
