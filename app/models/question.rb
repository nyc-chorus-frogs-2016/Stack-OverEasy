class Question < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  has_many :answers
  belongs_to :questioner, class_name: 'User'

  def best_answer
    Answer.find_by(id: self.best_answer_id)
  end

  def recent_questions
    self.order
  end

  def vote_count
    self.votes.sum(:value)
  end

  def recent_comments
    self.comments.order('created_at ASC')
  end

end
