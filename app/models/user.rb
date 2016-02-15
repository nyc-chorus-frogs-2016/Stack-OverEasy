class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, format: { with: /@/}, uniqueness: true

  has_many :questions, foreign_key: 'questioner_id'
  has_many :answers, foreign_key: 'responder_id'
  has_many :votes, foreign_key: 'voter_id'
  has_many :comments, foreign_key: 'commenter_id'

  before_save :downcase_email

  private

  def downcase_email
    self.email = email.downcase
  end
end
