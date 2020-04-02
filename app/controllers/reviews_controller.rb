class ReviewsController < ApplicationController
    def new
        @review = Review.new
    end

    def create
        @review = Review.new(review_requirements)
        if @review.save
          flash[:notice] = "Your review was successfully created"
          redirect_to reviews_path(@review)
        else
          render 'new'
        end 
    end

    def show
        @review = Review.find(params[:id])
    end

    def index
        @reviews = Review.all
    end

    def edit
       @review = Review.find(params[:id])
    end

    





    private

    def review_requirements
      params.require(:review).permit(:title, :review)
    end
end 