class PostCommentsController < ApplicationController
  before_action :set_post_comment, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :destroy]

  respond_to :json

  def index
    @post_comments = PostComment.all
    render json: @post_comments, include: [:user]
  end

  def show
    render json: @post_comment, include: [:user]
  end

  def create
    @post_comment = PostComment.new(post_comment_params)
    @post_comment.save
    render json: @post_comment, include: [:user]
  end

  def update
    @post_comment.update(post_comment_params)
    render json: @post_comment
  end

  def destroy
    @post_comment.destroy
  end

  private
    def set_post_comment
      @post_comment = PostComment.find(params[:id])
    end

    def post_comment_params
      params.require(:post_comment).permit(:content, :user_id, :post_id)
    end
end
