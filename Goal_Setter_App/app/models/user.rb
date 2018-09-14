class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :session_token, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}

  # has_many :goals,
  # foreign_key: :user_id,
  # class_name: :Goal
  

end