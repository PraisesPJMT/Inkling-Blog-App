require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    # user_path => /users/index

    it 'returns http success' do
      get '/users/'
      expect(response).to have_http_status(:success)
    end

    it 'render right template' do
      get '/users/'
      expect(response).to render_template(:index)
    end

    it 'render includes the title "Inkling Blog Users"' do
      get '/users/'
      expect(response.body).to include('Inkling Blog Users')
    end
  end

  describe 'GET /show' do
    # user_path(:user_id) => /users/:user_id

    it 'returns http success' do
      get '/users/1'
      expect(response).to have_http_status(:success)
    end

    it 'render right template' do
      get '/users/1'
      expect(response).to render_template(:show)
    end

    it 'render includes the sub-title "Bio"' do
      get '/users/1'
      expect(response.body).to include('Bio')
    end
  end
end
