require 'rails_helper'

RSpec.describe 'Post index', type: :feature do
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

  it 'display user\'s profile picture' do
    visit user_posts_path(@user_1)
    expect(page).to have_css("img[src*='#{@user_1.photo}']")
  end

  it 'display user\'s username' do
    visit user_posts_path(@user_1)
    expect(page).to have_content @user_1.name
  end

  it 'display user\'s number of posts' do
    visit user_path @user_2
    expect(page).to have_content "Number of posts: #{@user_2.posts_counter}"
  end

  it 'display a post title' do
    visit user_posts_path(@user_1)
    expect(page).to have_content @post_1.title
  end

  it 'display a post body' do
    visit user_posts_path(@user_1)
    expect(page).to have_content @post_1.text
  end

  it 'display a post first comments' do
    visit user_posts_path(@user_1)
    @post_1.recent_comments.each do |comment|
      expect(page).to have_content(comment.text)
    end
  end

  it 'display number of comments for each post' do
    visit user_posts_path(@user_1)
    expect(page).to have_content("Comments: #{@post_1.comments_counter}")
  end

  it 'display number of likes for each post' do
    visit user_posts_path(@user_2)
    expect(page).to have_content("Likes: #{@post_2.likes_counter}")
  end
end
