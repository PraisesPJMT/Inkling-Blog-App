require 'rails_helper'

RSpec.describe Like, type: :model do
  test_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from India.')
  second_test_user = User.create(name: 'Billy', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                                 bio: 'Doctor from Nigeria.')
  third_test_user = User.create(name: 'Milly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                                bio: 'Engineer from USA.')
  test_post = Post.create(author: test_user, title: 'Hello', text: 'This is my first post')
  context 'Like validation:' do
    it 'Like with user, and post should be valid' do
      test_like = Like.create(post: test_post, author: test_user)
      expect(test_like).to be_valid
    end

    it 'Like without user should be invalid' do
      test_like = Like.create(post: test_post)
      expect(test_like).to_not be_valid
    end

    it 'Like without post should be invalid' do
      test_like = Like.create(author: test_user)
      expect(test_like).to_not be_valid
    end
  end

  context 'Likes counter' do
    it 'New posts should have zero(0) likes when initialized' do
      new_test_post = Post.create(author: test_user, title: 'Hello', text: 'This is my first post')
      expect(new_test_post.likes_counter).to eq 0
    end

    it 'New Likes should be reflected on post through the #update_likes_counter method' do
      Like.create(post: test_post, author: test_user)
      Like.create(post: test_post, author: second_test_user)
      Like.create(post: test_post, author: third_test_user)
      expect(test_post.likes_counter).to eq 3
    end
  end
end
