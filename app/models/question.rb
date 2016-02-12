class Question < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  belongs_to :questioner, class_name: 'User'

  def best_answer
    Answer.find_by(id: self.best_answer_id)
  end
end
