require 'rails_helper'

RSpec.describe 'Post index', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'King Viserys',
                         photo: 'https://raw.githubusercontent.com/PraisesPJMT/Data/main/profiles/King_Viserys_I_Targaryen.png',
                         bio: 'was the fifth king of the Targaryen dynasty to rule the Seven Kingdoms.')

    @user2 = User.create(name: 'Prince Daemon',
                         photo: 'https://raw.githubusercontent.com/PraisesPJMT/Data/main/profiles/Prince_Daemon_Targaryen.png',
                         bio: 'Prince of the Targaryen dynasty, and the younger brother of King Viserys I Targaryen.')
    @post1 = Post.create(author: @user1, title: 'My Reign',
                         text: 'fifty years of peace and prosperity under his grandfather.')
    Comment.create(post: @post1, author: @user1, text: 'Great post')
    Comment.create(post: @post1, author: @user2, text: 'Interesting article')
    Like.create([{ post: @post1, author: @user1 }, { post: @post1, author: @user2 }])

    @post2 = Post.create(author: @user2, title: 'The Great Worrior I Am',
                         text: 'Later, while a disconsolate Viserys works on a large model of Old Valyria')
    Comment.create(post: @post2, author: @user1, text: 'I loved Sir Christien')
    Like.create({ post: @post2, author: @user1 })
  end

  it 'display user\'s profile picture' do
    visit user_posts_path(@user1)
    expect(page).to have_css("img[src*='#{@user1.photo}']")
  end

  it 'display user\'s username' do
    visit user_posts_path(@user1)
    expect(page).to have_content @user1.name
  end

  it 'display user\'s number of posts' do
    visit user_path @user2
    expect(page).to have_content "Number of posts: #{@user2.posts_counter}"
  end

  it 'display a post title' do
    visit user_posts_path(@user1)
    expect(page).to have_content @post1.title
  end

  it 'display a post body' do
    visit user_posts_path(@user1)
    expect(page).to have_content @post1.text
  end

  it 'display a post first comments' do
    visit user_posts_path(@user1)
    @post1.recent_comments.each do |comment|
      expect(page).to have_content(comment.text)
    end
  end

  it 'display number of comments for each post' do
    visit user_posts_path(@user1)
    expect(page).to have_content("Comments: #{@post1.comments_counter}")
  end

  it 'display number of likes for each post' do
    visit user_posts_path(@user2)
    expect(page).to have_content("Likes: #{@post2.likes_counter}")
  end

  it '"See post" button redirects to post show page' do
    visit user_posts_path(@user2)
    find("#post-box#{@post2.id}").click
    expect(current_path).to match user_posts_path(@post2)
  end
end
