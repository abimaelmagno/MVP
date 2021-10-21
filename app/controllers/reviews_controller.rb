class ReviewsController < ApplicationController
  before_action :find_restaurant
  
  def new
    @review = Review.new
  end

  def create
    # this instance of review is created with validation errors
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    # if not empty due to validations it will save. then:
    # raise
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      # render 'restaurants/show'
      render :new
    end
  end
  private
  
  def find_restaurant
    # in our routes for reviews it is :restaurant_id
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
