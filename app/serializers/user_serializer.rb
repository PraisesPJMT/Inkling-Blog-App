class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :bio, :posts_counter

  has_many :posts
end
