class PostCommentsController < ApplicationController
  before_action :set_post_comment, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @post_comments = PostComment.all
    respond_with(@post_comments)
  end

  def show
    respond_with(@post_comment)
  end

  def create
    @post_comment = PostComment.new(post_comment_params)
    @post_comment.save
    respond_with(@post_comment)
  end

  def update
    @post_comment.update(post_comment_params)
    respond_with(@post_comment)
  end

  def destroy
    @post_comment.destroy
    respond_with(@post_comment)
  end

  private
    def set_post_comment
      @post_comment = PostComment.find(params[:id])
    end

    def post_comment_params
      params.require(:post_comment).permit(:content, :user_id, :post_id)
    end
end
