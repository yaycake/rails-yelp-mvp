class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:new, :show, :edit, :destroy]

  def index
    @restaurants = Restaurants.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    redirect_to restaurants_path
  end

  def show
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(param[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end
end
