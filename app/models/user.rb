class User < ApplicationRecord
  has_many :cards
  has_many :rounds

  has_secure_password

  validates :username, presence: true, uniqueness: true
  validate :has_password

  private

  def has_password
    if self.password == ""
      errors.add("Password cannot be empty.")
    end
  end

end
