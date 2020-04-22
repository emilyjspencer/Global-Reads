class UsersController < ApplicationController

  before_action :user_credentials, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, only [:destroy]
  before_action :require_same_user, only: [: destroy, :edit, :update]

    def new 
      @user = User.new
    end

    def create
        @user = User.new(user_credentials)
       if @user.save
         session[:user_id] = @user.id
         flash[:success] = "Welcome to the Global Reads #{@user.username}"
         redirect_to user_path(@user)
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

     def destroy
      @user.destroy
      flash[:danger] = "User and all reviews created by user have been deleted"
      redirect_to users_path
    end 


    private

    def user_credentials

      params.require(:user).permit(:username, :email, :password) 
    end 

    def find_by_id
      @user = User.find(params[:id])
    end

    def require_admin
      if logged_in? and !current_user.admin?
        flash[:danger] = "Only administrators can perform that action"
        redirect_to root_path
      end 
    end 

    def require_same_user
      if current_user != @user and !current_user.admin? 
        flash[:danger] = "You can only edit your own account"
        redirect_to root_path
      end
    end

end