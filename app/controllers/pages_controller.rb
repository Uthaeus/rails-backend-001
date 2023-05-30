class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:user_check]

  respond_to :json

  def home
    @welcome_message = "Welcome to the home page!"

    render json: { message: @welcome_message }
  end

  def user_check
    render json: current_user
  end
end
