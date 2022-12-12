require 'rails_helper'

RSpec.describe 'Post show', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'King Viserys',
                         photo: 'https://raw.githubusercontent.com/PraisesPJMT/Data/main/profiles/King_Viserys_I_Targaryen.png',
                         bio: 'was the fifth king of the Targaryen dynasty to rule the Seven Kingdoms.')

    @user2 = User.create(name: 'Prince Daemon',
                         photo: 'https://raw.githubusercontent.com/PraisesPJMT/Data/main/profiles/Prince_Daemon_Targaryen.png',
                         bio: 'Prince of the Targaryen dynasty, and the younger brother of King Viserys I Targaryen.')
    @post1 = Post.create(author: @user1, title: 'My Reign',
                         text: 'unprecedented fifty years of peace and prosperity under his grandfather.')
    Comment.create(post: @post1, author: @user1, text: 'Great post')
    Comment.create(post: @post1, author: @user2, text: 'Interesting article')
    Like.create([{ post: @post1, author: @user1 }, { post: @post1, author: @user2 }])

    @post2 = Post.create(author: @user2, title: 'The Great Worrior I Am',
                         text: 'Later, while a disconsolate Viserys works on a large model of Old Valyria')
    Comment.create(post: @post2, author: @user1, text: 'I loved Sir Christien')
    Like.create({ post: @post2, author: @user1 })
  end

  it 'display post\'s title' do
    visit user_post_path(@post1, @user1)
    expect(page).to have_content @post1.title
  end

  it 'display post\'s author' do
    visit user_post_path(@post1, @user1)
    expect(page).to have_content @post1.author.name
  end

  it 'display post\'s comments count' do
    visit user_post_path(@post2, @user2)
    expect(page).to have_content("Comments: #{@post2.comments_counter}")
  end

  it 'display post\'s likes count' do
    visit user_post_path(@post2, @user2)
    expect(page).to have_content("Likes: #{@post2.likes_counter}")
  end

  it 'display post\'s body' do
    visit user_post_path(@post1, @user1)
    expect(page).to have_content @post1.text
  end

  it 'display post\'s commenter\'s name' do
    visit user_post_path(@post1, @user1)
    @post1.comments.each do |comment|
      expect(page).to have_content comment.author.name
    end
  end

  it 'display post\'s commenter\'s text' do
    visit user_post_path(@post2, @user2)
    @post2.comments.each do |comment|
      expect(page).to have_content comment.text
    end
  end
end
