class Author < ApplicationRecord
  has_one :profile
  has_many :posts
end
