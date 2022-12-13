require 'rails_helper'

RSpec.describe 'Users index', type: :request do
  before(:each) do
    @test_user = User.create(name: 'Lilly',
                             photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                             bio: 'Teacher from Nigeria.')
    # user_path => /users/index
    get users_path
  end


  it 'returns http success' do
    expect(response).to have_http_status(:success)
  end

  it 'render right template' do
    expect(response).to render_template(:index)
  end

  it 'render includes the title "Inkling Blog Users"' do
    expect(response.body).to include('Inkling Blog Users')
  end
end
