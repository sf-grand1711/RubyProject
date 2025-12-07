class User < ApplicationRecord
  # validates :name, presence: true
  # validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  # validates :password, presence: true, length: { minimum: 6 }, if: -> { new_record? || password.present? }

  has_secure_password

  def self.authenticate(email, password)
    user = find_by(email: email)
    user if user && user.authenticate(password)
  end
end
