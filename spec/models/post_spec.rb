require 'rails_helper'

RSpec.describe Post, type: :model do
  test_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  test_user.save
  first_post = Post.create(author: test_user, title: 'Hello', text: 'This is my first post')
  second_post = Post.create(author: test_user, title: 'Hey', text: 'This is my first post')
  third_post = Post.create(author: test_user, title: 'Greetings', text: 'This is my first post')
  fourth_post = Post.create(author: test_user, title: 'Introduction', text: 'This is my first post')
  fifth_post = Post.create(author: test_user, title: 'Apology', text: 'This is my first post')
  six_post = Post.create(author: test_user, title: 'Hello', text: 'This is my first post')
  describe 'Validations:' do
    context 'Title validations:' do
      it 'Post with title should be valid' do
        first_post.save
        second_post.save
        expect(first_post).to be_valid
        expect(second_post).to be_valid
      end

      it 'User without title should be invalid' do
        third_post.title = nil
        third_post.save
        fourth_post.title = nil
        fourth_post.save
        expect(third_post).to_not be_valid
        expect(fourth_post).to_not be_valid
      end

      it 'User with title longer than 250 characters should be invalid' do
        third_post.title = Array.new(10, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLM').join
        third_post.save
        fourth_post.title = Array.new(10, '123456789htmlcssjspyrbdgspecint').join
        fourth_post.save
        expect(third_post).to_not be_valid
        expect(fourth_post).to_not be_valid
      end
    end

    context 'Comments_counter validations:' do
      it 'Posts on initialization should have integer values for comments_counter' do
        fifth_post.save
        six_post.save
        expect(fifth_post).to be_valid
        expect(six_post).to be_valid
      end

      it 'Posts with integer values for comments_counter should be valid' do
        first_post.save
        second_post.save
        expect(first_post.comments_counter).to eq 0
        expect(second_post.comments_counter).to eq 0
      end

      it 'Posts with integer values for comments_counter less than zero should be invalid' do
        third_post.comments_counter = -1
        third_post.save
        fourth_post.comments_counter = -72
        fourth_post.save
        expect(third_post).to_not be_valid
        expect(fourth_post).to_not be_valid
      end
    end

    context 'Likes_counter validations:' do
      it 'Posts on initialization should have integer values for likes_counter' do
        fifth_post.save
        six_post.save
        expect(fifth_post).to be_valid
        expect(six_post).to be_valid
      end

      it 'Posts with integer values for likes_counter should be valid' do
        first_post.save
        second_post.save
        expect(first_post.likes_counter).to eq 0
        expect(second_post.likes_counter).to eq 0
      end

      it 'Posts with integer values for likes_counter less than zero should be invalid' do
        third_post.likes_counter = -1
        third_post.save
        fourth_post.likes_counter = -72
        fourth_post.save
        expect(third_post).to_not be_valid
        expect(fourth_post).to_not be_valid
      end
    end
  end
  describe 'Tests:' do
    context 'Methods of Post:' do
      it '#update_posts_counter should be zero on initialization of User' do
        new_test_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                                    bio: 'Teacher from Mexico.')
        new_test_user.save
        expect(new_test_user.posts_counter).to eq 0
      end

      it '#update_posts_counter should reflect addition os multiple posts' do
        expect(test_user.posts_counter).to eq 6
      end

      it '#recent_comments method should return zero(0) when new post is created' do
        fourth_post.save
        expect(fourth_post.recent_comments.count).to eq 0
      end

      it '#recent_comments method should return last five(5) comments on post' do
        fifth_post.save
        Comment.create(post: fifth_post, author: test_user, text: 'Hi Tom!')
        Comment.create(post: fifth_post, author: test_user, text: 'What an interesting topic')
        Comment.create(post: fifth_post, author: test_user, text: 'I love cats as pet')
        Comment.create(post: fifth_post, author: test_user, text: 'Liverpool FC is the best')
        Comment.create(post: fifth_post, author: test_user, text: 'The USA is evil')
        Comment.create(post: fifth_post, author: test_user, text: 'Ruby on Rails is cool')
        Comment.create(post: fifth_post, author: test_user, text: 'I am an atheist')
        expect(fifth_post.recent_comments.count).to eq 5
      end
    end
  end
end
