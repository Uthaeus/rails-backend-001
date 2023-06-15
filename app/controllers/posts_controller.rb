class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :destroy]

  respond_to :json

  def index
    @posts = Post.all
    render json: @posts, include: [:user]
  end

  def show
    render json: @post, include: [:user]
  end

  def create
    @post = Post.new(post_params)
    @post.save
    render json: @post
  end

  def update
    @post.update(post_params)
    render json: @post
  end

  def destroy
    @post.destroy
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:image, :body, :user_id)
    end
end
