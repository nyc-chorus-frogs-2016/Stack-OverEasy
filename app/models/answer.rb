class Answer < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  belongs_to :question
  belongs_to :responder, class_name: 'User'

  def my_comments
    self.comments
  end


end
