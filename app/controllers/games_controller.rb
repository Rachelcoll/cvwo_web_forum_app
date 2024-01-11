class GamesController < ApplicationController
    include CurrentUserConcern
    def index
        games = Game.all
        render json: games
    end

    def avg_score
        @game = Game.find(params[:id])
        if @game.reviews.present?
        average_score = @game.reviews.average(:score)
            if average_score
                render json: {avg_score: average_score}
            else
                render json: {error: "backend error"}
            end
        else
            render json: {status: "there is no reviews yet"}
        end
    end

    def user_games
        if @current_user
            games = @current_user.reviews.all.map do |review|
                {
                    game: review.game
                }
            end
        render json: games
        end
    end

end
