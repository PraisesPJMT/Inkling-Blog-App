require 'rails_helper'

RSpec.describe 'Users show', type: :request do
  before(:each) do
    @test_user = User.create(name: 'Lilly',
                             photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                             bio: 'Teacher from Nigeria.')
    # user_path(:user_id) => /users/:user_id
    get "/users/#{@test_user.id}"
  end

  it 'returns http success' do
    expect(response).to have_http_status(:success)
  end

  it 'render right template' do
    expect(response).to render_template(:show)
  end

  it 'render includes the sub-title "Bio"' do
    expect(response.body).to include('Bio')
  end
end
