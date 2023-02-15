class FoodController < ApplicationController
  def index
    @foods = Food.all
  end

  def new 

  end

  def create
    @food = Food.create!(name: params[:name], measurement_unit: params[:measurement_unit], price: params[:price], quantity: params[:quantity], user: current_user)
    
    if @food.save
      redirect_to food_index_path
    else
      render 'new'
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy

    redirect_to food_index_path
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
