class SessionsController < ApplicationController
include CurrentUserConcern
    def create
        email = params["user"]["email"]
        puts "Searching for user with email: #{email}"
        @user = User.find_by(email: email) 
                    .try(:authenticate, params["user"]["password"])
        if @user
            session[:user_id] = @user.id
            render json: {
                status: :created,
                logged_in: true,
                user: @user
            }
        else
            render json: { status: 401 }
        end
    end

    def logged_in
        if @current_user
            render json: {
                logged_in: true,
                user: @current_user
            }
        else
            render json: {
                logged_in: false
            }
        end
    end

    def logged_out
        reset_session
        render json: {
            status: 200,
            logged_out: true
        }
    end
end