class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :session_token, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}
  after_initialize :ensure_session_token

  attr_reader :password
  
  has_many :goals,
  foreign_key: :user_id,
  class_name: :Goal
  
  def ensure_session_token
    # self.session_token ||= SecureRandom.urlsafe_base64
    self.session_token ||= reset_session_token!
  end 
  
  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save  
    self.session_token
  end 
  
  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end


  def self.find_by_credentials(username, password) 
    user = User.find_by(username: username)
    user && BCrypt::Password.new(user.password_digest).is_password?(password) ? user : nil 
  end 
  
end