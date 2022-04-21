# frozen_string_literal: true

# user module
class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  validates_confirmation_of :password, if: ->(user) { user.password.present? }
  has_secure_password(validations: false)

  def to_token
    {
      id: id,
      email: email,
      full_name: "#{first_name} #{last_name}"
    }
  end
end
