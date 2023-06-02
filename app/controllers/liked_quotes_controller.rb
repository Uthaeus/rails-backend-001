class LikedQuotesController < ApplicationController
    before_action :authenticate_user!, only: [:create, :destroy]
    respond_to :json

    def create 
        liked_quote = current_user.liked_quotes.create(liked_quote_params)
        render json: liked_quote
    end

    def destroy
        liked_quote = current_user.liked_quotes.find(params[:id])
        liked_quote.destroy
        render json: liked_quote
    end

    private

    def liked_quote_params
        params.require(:liked_quote).permit(:quote, :author, :user_id)
    end
end