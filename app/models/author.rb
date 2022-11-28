class Author < ApplicationRecord
  has_one :profile
  has_many :posts
  has_many :tags, through: :posts
end
