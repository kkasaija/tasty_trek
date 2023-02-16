class FoodController < ApplicationController
  def index
    @foods = current_user.foods
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.create!(food_params.merge(user: current_user))

    if @food.save
      redirect_to food_index_path, notice: 'Food added successfully.'
    else
      render new, alert: 'Operation failed.'
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy

    redirect_to food_index_path, notice: 'Food deleted successfully'
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
