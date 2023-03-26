class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant
    else
      flash.now[:error] = "The form contains errors, please check the entered informations."
      render :new
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant
    else
      flash.now[:error] = "The form contains errors, please check the entered informations."
      render :update
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.destroy
      redirect_to restaurants_path
    else
      flash.now[:error] = "Impossible to delete the restaurant"
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :chef, :stars)
  end
end
