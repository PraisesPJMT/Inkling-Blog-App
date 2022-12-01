require 'rails_helper'

RSpec.describe Comment, type: :model do
  test_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          bio: 'Teacher from Nigeria.')
  test_post = Post.create(author: test_user, title: 'Hello', text: 'This is my first post')

  context 'Comment validation:' do
    it 'Comment with user, post, and text should be valid' do
      test_comment = Comment.create(post: test_post, author: test_user, text: 'Hi Tom!')
      expect(test_comment).to be_valid
    end

    it 'Comment without user should be invalid' do
      test_comment = Comment.create(post: test_post, text: 'Hi Tom!')
      expect(test_comment).to_not be_valid
    end

    it 'Comment without post should be invalid' do
      test_comment = Comment.create(author: test_user, text: 'Hi Tom!')
      expect(test_comment).to_not be_valid
    end
  end

  context 'Comments counter' do
    it 'New posts should have zero(0) comments when initialized' do
      new_test_post = Post.create(author: test_user, title: 'Hello', text: 'This is my first post')
      expect(new_test_post.comments_counter).to eq 0
    end

    it 'New comments should be reflected on post through the #update_comments_counter method' do
      Comment.create(post: test_post, author: test_user, text: 'This is impossible!')
      Comment.create(post: test_post, author: test_user, text: 'Dancing on your street!')
      Comment.create(post: test_post, author: test_user, text: 'Beautifully unfinished!')
      expect(test_post.comments_counter).to eq 3
    end
  end
end
