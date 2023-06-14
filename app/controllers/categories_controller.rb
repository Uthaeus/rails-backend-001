class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :destroy]

  respond_to :json

  def index
    @categories = Category.all
    render json: @categories
  end

  def show
    render json: @category, include: [:blogs]
  end

  def create
    @category = Category.new(category_params)
    @category.save
    render json: @category
  end

  def update
    @category.update(category_params)
    render json: @category
  end

  def destroy
    @category.destroy
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:title, :blog_id, :user_id)
    end
end
