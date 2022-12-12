require 'rails_helper'

RSpec.describe 'User show: ', type: :feature do
  before(:each) do
    @user_1 = User.create(name: 'King Viserys',
                          photo: 'https://raw.githubusercontent.com/PraisesPJMT/Data/main/profiles/King_Viserys_I_Targaryen.png',
                          bio: 'Remembered as Viserys the Peaceful, was the fifth king of the Targaryen dynasty to rule the Seven Kingdoms.')

    @user_2 = User.create(name: 'Prince Daemon',
                          photo: 'https://raw.githubusercontent.com/PraisesPJMT/Data/main/profiles/Prince_Daemon_Targaryen.png',
                          bio: 'Prince of the Targaryen dynasty, and the younger brother of King Viserys I Targaryen.')
    @post_1 = Post.create(author: @user_1, title: 'My Reign',
                          text: 'Viserys inherited the realm after an unprecedented fifty years of peace and prosperity under his grandfather.')
    Comment.create(post: @post_1, author: @user_1, text: 'Great post')
    Comment.create(post: @post_1, author: @user_2, text: 'Interesting article')
    Like.create([{ post: @post_1, author: @user_1 }, { post: @post_1, author: @user_2 }])

    @post_2 = Post.create(author: @user_2, title: 'The Great Worrior I Am',
                          text: 'Later, while a disconsolate Viserys works on a large model of Old Valyria')
    Comment.create(post: @post_2, author: @user_1, text: 'I loved Sir Christien')
    Like.create({ post: @post_2, author: @user_1 })
  end

  it 'display user\'s username' do
    visit user_path @user_1
    expect(page).to have_content @user_1.name
  end

  it 'display user\'s profile picture' do
    visit user_path @user_1
    expect(page).to have_css("img[src*='#{@user_1.photo}']")
  end

  it 'display user\'s number of posts' do
    visit user_path @user_2
    expect(page).to have_content "Number of posts: #{@user_2.posts_counter}"
  end

  it 'display user\'s bio' do
    visit user_path @user_2
    expect(page).to have_content @user_2.bio
  end

  it 'display user\'s recent three posts' do
    visit user_path @user_1
    @user_1.recent_posts.each do |post|
      expect(page).to have_content post.text
    end
  end

  it 'display button to see all user posts' do
    visit user_path @user_1
    expect(page).to have_content 'See all posts'
  end

  it '"See all post" button redirects to posts index page' do
    visit user_path @user_2
    click_link 'See all posts'
    expect(page).to have_current_path user_posts_path(@user_2)
  end
end
