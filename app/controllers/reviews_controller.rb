class ReviewsController < ApplicationController
    include CurrentUserConcern
    def index
        @game = Game.find(params[:game_id])
        game_reviews = @game.reviews.all.map do |review|
            {
                review: review,
                user: review.user
            }
        end
        render json: game_reviews
    end

    def create
        @game = Game.find(params[:game_id])
        @review = @current_user.reviews.create(review_params)
        @review.game = @game
        if @review.save
            render json: {review: @review}
        else
            render json: {status: 500}
        end
    end

    def destroy
        @review = Review.find(params[:id])
        if @current_user == @review.user
            @review.destroy
            render json: {status: "successfully deleted"}
        else
            render json: {status: 500}
        end
    end

    private
    def review_params
        params.require(:review).permit(:game_review, :score)
    end
end
