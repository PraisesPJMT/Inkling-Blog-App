require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:each) do
    @test_user = User.create(name: 'Lilly',
                             photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                             bio: 'Teacher from Nigeria.')
  end
  describe 'GET /index' do
    # user_path => /users/index
    before(:example) { get users_path }

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

  describe 'GET /show' do
    # user_path(:user_id) => /users/:user_id
    before(:example) { get "/users/#{@test_user.id}" }

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
end
