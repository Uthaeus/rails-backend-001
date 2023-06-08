class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :destroy]

  respond_to :json

  def index
    @blogs = Blog.all
    render json: @blogs, include: :user
  end

  def show
    render json: @blog
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.save
    render json: @blog
  end

  def update
    @blog.update(blog_params)
    render json: @blog
  end

  def destroy
    @blog.destroy
    respond_with(@blog)
  end

  private
    def set_blog
      @blog = Blog.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:title, :body, :user_id)
    end
end
