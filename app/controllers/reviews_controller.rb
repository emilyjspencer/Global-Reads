class ReviewsController < ApplicationController
    def new
        @review = Review.new
    end

    def create
        @review = Review.new(review_requirements)
        @review.save
        redirect_to reviews_path(@review)
    end

    





    private

    def review_requirements
      params.require(:review).permit(:title, :review)
    end
end 