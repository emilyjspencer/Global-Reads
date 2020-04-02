class ReviewsController < ApplicationController

    before_action :find_by_id, only: [:edit, :update, :show, :destroy]


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
    end

    def index
        @reviews = Review.all
    end

    def edit
    end

    def update
        if @review.update(review_requirements)
         flash[:notice] = "Your review was successfully updated"
         redirect_to review_path(@review)
        else
         flash[:notice] = "Your review was not updated"
         render 'edit'
        end
      end

      def destroy
        @review.destroy
        flash[:notice] = "Your review deleted"
        redirect_to reviews_path
       end

    





    private

    def find_by_id
      @review = Review.find(params[:id])
    end

    def review_requirements
      params.require(:review).permit(:title, :review)
    end
end 