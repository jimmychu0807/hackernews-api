class ApplicationController < ActionController::Base
  before_action :get_current_user
  attr_reader :current_user

  def get_current_user
    auth_token = request.headers['Authorization']&.split(' ')&.second
    user = AuthToken.user_from_token(auth_token)
    if user
      @current_user = user
    end
  end
end
