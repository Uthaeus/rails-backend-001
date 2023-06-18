class PostLikesController < ApplicationController
  before_action :set_post_like, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :destroy]

  respond_to :json

  def index
    @post_likes = PostLike.all
    render json: @post_likes
  end

  def show
    render json: @post_like
  end

  def create
    @post_like = PostLike.new(post_like_params)
    @post_like.save
    render json: @post_like
  end

  def update
    @post_like.update(post_like_params)
    render json: @post_like
  end

  def destroy
    @post_like.destroy
  end

  private
    def set_post_like
      @post_like = PostLike.find(params[:id])
    end

    def post_like_params
      params.require(:post_like).permit(:user_id, :post_id)
    end
end
