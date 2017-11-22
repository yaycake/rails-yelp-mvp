class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      puts "\n1\n#{@review.errors.full_messages}\n\n"
      redirect_to restaurant_path(@review.restaurant)
    else
      puts "\n2\n#{@review.errors.full_messages}\n\n"
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
