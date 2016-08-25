class Film < ActiveRecord::Base
  has_many :film_genres
  has_many :genres, through: :film_genres
  # has_many :roles
  # has_many :actors, through: :roles
  has_many :comments, as: :commentable
  has_many :commenters, through: :comments
  has_many :reviews, as: :reviewable
  has_many :reviewers, through: :reviews

  validates :title, :release_year, :description, presence: true
  validates_format_of :release_year, with: /\A\d{4}\z/, on: :save
end
