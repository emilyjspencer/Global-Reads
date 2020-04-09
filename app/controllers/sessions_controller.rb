class SessionsController < ApplicationController

  def new
  end

  def create 
    user = User.find_by(email: params[:session][:email].downcase)
    if user  && user.authenticate(params[:session][:password])
     session[:user_id] = user.id
     flash[:success] = "You have successfully logged in"
     redirect_to users_path(user)
    else
     flash.now[:danger] = "Your email or password was incorrect. Please try again"
     render 'new'
    end
   end

   def destroy
    session[:user_id] = nil
    flash[:success] = "You have been logged out"
    redirect_to root_path
   end
end