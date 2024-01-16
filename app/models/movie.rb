class Movie < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true

  has_many :bookmarks
  attribute :poster_url, :string
  attribute :rating, :float
end
