class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:user_check]

  respond_to :json

  def home
  end

  def user_check
    render json: current_user
  end
end
