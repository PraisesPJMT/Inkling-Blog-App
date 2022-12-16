class Api::V1::ApplicationController < ActionController::API
  before_action :confirm_access
  respond_to :json

  private

  def confirm_access
    # access = current_user.access_token == params[:access_token]
    access = User.find_by_access_token(params[:access_token])
    head :unauthorized unless access
  end
end
