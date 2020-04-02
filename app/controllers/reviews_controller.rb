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

    def update
        @review = Review.find(params[:id])
        if @review.update(review_requirements)
         flash[:notice] = "Your review was successfully updated"
         redirect_to review_path(@review)
        else
         flash[:notice] = "Your review was not updated"
         render 'edit'
        end
      end

      def destroy
        @review = Review.find(params[:id])
        @review.destroy
        flash[:notice] = "Your review deleted"
        redirect_to reviews_path
       end

    





    private

    def review_requirements
      params.require(:review).permit(:title, :review)
    end
end 