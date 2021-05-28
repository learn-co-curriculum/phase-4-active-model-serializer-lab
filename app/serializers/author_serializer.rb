class AuthorSerializer < ActiveModel::Serializer
  attributes :name
  has_one :profile
  has_many :posts, serializer: AuthorPostSerializer
end
