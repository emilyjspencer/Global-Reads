class ReviewsController < ApplicationController

    before_action :find_by_id, only: [:edit, :update, :show, :destroy]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    before_action :require_user, except: [:index, :show]


    def new
      @review = Review.new
    end

    def create
      @review = Review.new(review_requirements)
      @review.user = current_user 
      if @review.save
        flash[:success] = "Your review was successfully created"
        redirect_to reviews_path(@review)
      else
        render 'new'
      end 
    end

    def show
    end

    def index
      @reviews = Review.paginate(page: params[:page], per_page: 5)
    end

    def edit
    end

    def update
      if @review.update(review_requirements)
        flash[:success] = "Your review was successfully updated"
        redirect_to review_path(@review)
      else
        flash[:success] = "Your review was not updated"
        render 'edit'
      end
    end

    def destroy
      @review.destroy
      flash[:success] = "Your review was deleted"
      redirect_to reviews_path
    end

  
    private

    def find_by_id
      @review = Review.find(params[:id])
    end

    def review_requirements
      params.require(:review).permit(:title, :review)
    end

    def require_same_user
      if current_user != @review.user
        flash[:danger] = "You can only edit or delete your own review"
        redirect_to root_path
      end
    end 
    
end 