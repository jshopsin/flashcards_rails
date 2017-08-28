class Card < ApplicationRecord
  belongs_to :deck
  belongs_to :user

  has_many :guesses
end
