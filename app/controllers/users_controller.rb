class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_credentials)
    end



    private

    def user_credentials
        params.require(:user).permit(:username, :email, :password)
    end 
end