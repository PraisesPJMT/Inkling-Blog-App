require 'rails_helper'

RSpec.describe 'User index: ', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'King Viserys',
                         photo: 'https://raw.githubusercontent.com/PraisesPJMT/Data/main/profiles/King_Viserys_I_Targaryen.png',
                         bio: 'the Black Dread in his youth before the dragon\'s death of old age.')

    @user2 = User.create(name: 'Prince Daemon',
                         photo: 'https://raw.githubusercontent.com/PraisesPJMT/Data/main/profiles/Prince_Daemon_Targaryen.png',
                         bio: 'and later becomes her second husband and king consort.')
    visit users_path
  end

  it 'display the username of all users' do
    User.all.each do |user|
      expect(page).to have_content(user.name)
    end
  end

  it 'displays profile picture of all user' do
    User.all.each do |user|
      expect(page).to have_css("img[src*='#{user.photo}']")
    end
  end

  it 'displays number of posts for each user' do
    User.all.each do |user|
      expect(page).to have_content "Number of posts: #{user.posts_counter}"
    end
  end

  it 'redirects to user show page when a user is clicked' do
    find("#user-box#{@user1.id}").click
    expect(current_path).to match user_path(@user1)
    # user-box
    # <%= link_to "Add New Comment", new_user_post_comment_path(user_id: @user.id, post_id: @post.id) %>
    # within all('a')[0] do |user|
    #   # click_link user
    #   visit users_path
    # end
  end
end
