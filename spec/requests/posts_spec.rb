require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    # user_post_path => /users/:user_id/posts

    it 'returns http success' do
      get '/users/1/posts'
      expect(response).to have_http_status(:success)
    end

    it 'render right template' do
      get '/users/1/posts'
      expect(response).to render_template(:index)
    end

    it 'render includes the sub-title "Post"' do
      get '/users/1/posts'
      expect(response.body).to include('Post')
    end
  end

  describe 'GET /show' do
    # user_post_path => /users/:user_id/posts/:id

    it 'returns http success' do
      get '/users/1/posts/4'
      expect(response).to have_http_status(:success)
    end

    it 'render right template' do
      get '/users/1/posts/4'
      expect(response).to render_template(:show)
    end

    it 'render includes the sub-title "Post"' do
      get '/users/1/posts/4'
      expect(response.body).to include('Post')
    end
  end
end
