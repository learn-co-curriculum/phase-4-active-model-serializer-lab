class PostSerializer < ActiveModel::Serializer
  attributes :title, :content, :post_tags

  belongs_to :author
  has_many :tags
end
