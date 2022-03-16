class User < ActiveRecord::Base

  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, :uniqueness {case_sensitive: false}=> true, presence: true
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true 


end