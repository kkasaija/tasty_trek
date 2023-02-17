class FoodController < ApplicationController
  before_action :authenticate_user!

  def index
      @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    @user = current_user
    @food = @user.foods.build(food_params)

    if @food.save
      flash.now[:success] = 'Food added successfully'
      redirect_to food_index_path
    else
      flash.now[:danger] = 'Operation failed'
      render 'new'
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy

    redirect_to food_index_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
