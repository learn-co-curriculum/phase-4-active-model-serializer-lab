class ProfileSerializer < ActiveModel::Serializer
  attributes :username, :email, :bio, :avatar_url
  belongs_to :author
end
