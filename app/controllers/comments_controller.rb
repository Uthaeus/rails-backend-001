class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :destroy]

  respond_to :json

  def index
    @comments = Comment.all
    render json: @comments, include: :user
  end

  def show
    render json: @comment, include: :user
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    render json: @comment, include: :user
  end

  def update
  end

  def destroy
    @comment.destroy
    render json: @comment, include: :user
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:user_id, :blog_id, :content)
    end
end
