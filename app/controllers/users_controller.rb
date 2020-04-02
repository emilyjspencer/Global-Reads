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

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_credentials)
       flash[:success] = "Your account was successfully updated"
       redirect_to reviews_path
      else
       render 'edit'
      end
     end

     def show
      @user = User.find(params[:id])
     end


    private

    def user_credentials
        params.require(:user).permit(:username, :email, :password)
    end 
end