class PostSerializer < ActiveModel::Serializer
  attributes :id, :author_id, :title, :text, :comments_counter, :likes_counter

  has_many :comments
  has_many :likes

  belongs_to :author, class_name: 'User'
end
