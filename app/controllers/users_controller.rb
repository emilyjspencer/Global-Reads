class UsersController < ApplicationController

  before_action :user_credentials, only: [:show, :edit, :update]

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
    end

    def update
      if @user.update(user_credentials)
       flash[:success] = "Your account was successfully updated"
       redirect_to reviews_path
      else
       render 'edit'
      end
     end

     def show
      @user_reviews = @user.reviews.paginate(page: params[:page], per_page: 5)
     end

     def index
      @users = User.paginate(page: params[:page], per_page: 5)
     end


    private

    def user_credentials
      params.require(:user).permit(:username, :email, :password)
      
    end 

    def find_by_id
      @user = User.find(params[:id])
    end

end