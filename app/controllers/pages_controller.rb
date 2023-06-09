class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:user_check]

  respond_to :json

  def home
  end

  def user_check
    render json: current_user, include: [:liked_quotes, :blogs, :comments, :posts, :post_likes, :post_comments]
  end

  def user_detail
    @user = User.find(params[:id])
    render json: @user, include: [:blogs, :comments, :liked_quotes, :posts, :post_likes, :post_comments]
  end
end
