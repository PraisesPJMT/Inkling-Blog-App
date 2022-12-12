require 'rails_helper'

RSpec.describe 'Post show', type: :feature do
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

  it 'display post\'s title' do
    visit user_post_path(@post_1, @user_1)
    expect(page).to have_content @post_1.title
  end

  it 'display post\'s author' do
    visit user_post_path(@post_1, @user_1)
    expect(page).to have_content @post_1.author.name
  end

  it 'display post\'s comments count' do
    visit user_post_path(@post_2, @user_2)
    expect(page).to have_content("Comments: #{@post_2.comments_counter}")
  end

  it 'display post\'s likes count' do
    visit user_post_path(@post_2, @user_2)
    expect(page).to have_content("Likes: #{@post_2.likes_counter}")
  end

  it 'display post\'s body' do
    visit user_post_path(@post_1, @user_1)
    expect(page).to have_content @post_1.text
  end

  it 'display post\'s commenter\'s name' do
    visit user_post_path(@post_1, @user_1)
    @post_1.comments.each do |comment|
      expect(page).to have_content comment.author.name
    end
  end

  it 'display post\'s commenter\'s text' do
    visit user_post_path(@post_2, @user_2)
    @post_2.comments.each do |comment|
      expect(page).to have_content comment.text
    end
  end
end
