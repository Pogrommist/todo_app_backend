class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    render json: current_user
  end

  def update_user
    return unless current_user
    user_params = {
      name: params[:name],
      avatar_url: params[:avatar]
  }
    current_user.update_attributes(user_params)
    render json: current_user
  end
end