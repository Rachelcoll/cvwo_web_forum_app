class RegistrationsController < ApplicationController
    def create
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            render json: {
                status: :created,
                user: @user
            }
        else
            render json: { status: 500 }
        end
       
    end

    private
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end

end
