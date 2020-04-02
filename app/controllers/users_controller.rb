class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_credentials)
       if @user.save
         flash[:success] = "Welcome to the Global Reads #{@user.username}"
         redirect_to reviews_path
       else
         render 'new'
       end
    end



    private

    def user_credentials
        params.require(:user).permit(:username, :email, :password)
    end 
end