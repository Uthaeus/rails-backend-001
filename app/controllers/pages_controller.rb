class PagesController < ApplicationController
  respond_to :json
  def home
    @welcome_message = "Welcome to the home page!"

    render json: { message: @welcome_message }
  end

  def user_check
  end
end
