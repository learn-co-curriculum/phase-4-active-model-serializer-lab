class PostSerializer < ActiveModel::Serializer
  attributes :title, :content
  belongs_to :author
  has_many :tags
end
