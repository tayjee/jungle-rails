class User < ActiveRecord::Base

  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: {case_sensitive: false}, presence: true
  validates :password, presence: true, confirmation: true, length: {minimum: 6}
  validates :password_confirmation, presence: true 

  def self.authenticate_with_credentials(email, password)
    user = User.where('email = ?', email.strip.downcase).first

    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end