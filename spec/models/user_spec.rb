require 'rails_helper'

RSpec.describe User, type: :model do
  first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                            bio: 'Teacher from Poland.')
  third_user = User.create(name: 'Joy', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Nigeria.')
  fourth_user = User.create(name: 'Elli', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from China.')
  describe 'Validations:' do
    context 'Name validations:' do
      it 'User with name should be valid' do
        first_user.save
        second_user.save
        expect(first_user).to be_valid
        expect(second_user).to be_valid
      end

      it 'User without name should be invalid' do
        third_user.name = nil
        third_user.save
        fourth_user.name = nil
        fourth_user.save
        expect(third_user).to_not be_valid
        expect(fourth_user).to_not be_valid
      end
    end

    context 'Post_counter validations:' do
      it 'Users on initialization should have integer values for post_counter' do
        first_user.save
        second_user.save
        expect(first_user).to be_valid
        expect(second_user).to be_valid
      end

      it 'Users with integer values for post_counter should be valid' do
        first_user.posts_counter = 2
        first_user.save
        second_user.posts_counter = 19
        second_user.save
        expect(first_user).to be_valid
        expect(second_user).to be_valid
      end

      it 'Users with none-integer values for post_counter should be invalid' do
        third_user.posts_counter = 'Two'
        third_user.save
        fourth_user.posts_counter = 'Twelve'
        fourth_user.save
        expect(third_user).to_not be_valid
        expect(fourth_user).to_not be_valid
      end
    end
  end

  describe 'Tests:' do
    context 'Methods of User:' do
      it '#recent_posts method should return zero(0) when new user is created' do
        new_user = User.create(name: 'Elli', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                               bio: 'Teacher from China.')
        expect(new_user.recent_posts.count).to eq 0
      end

      it '#recent_posts method should return last three(5) posts of user' do
        Post.create(author: third_user, title: 'Independence', text: 'Independence leads to freedom')
        Post.create(author: third_user, title: 'Codding',
                    text: 'Software development is a crucial aspect of tech industry')
        Post.create(author: third_user, title: 'Nigeria', text: 'Nigeria is a beautiful country to visit')
        Post.create(author: third_user, title: 'Microverse',
                    text: 'Is Microverse really the best tech school out there?')
        expect(third_user.recent_posts.count).to eq 3
      end
    end
  end
end
