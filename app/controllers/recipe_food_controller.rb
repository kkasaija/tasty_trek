class RecipeFoodController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
    @foods = Food.all
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @food = Food.find(params[:recipe_food][:food])
    @recipe_food = RecipeFood.new(recipe: @recipe, food: @food, quantity: params[:recipe_food][:quantity])

    if @recipe_food.save
      redirect_to @recipe, notice: 'Ingredient was successfully added.'
    else
      render :new, alert: "Couldn't add Ingredient to your recipe"
    end
  end

  def destroy
    @ingredient = RecipeFood.find(params[:id])
    @ingredient.destroy

    redirect_to recipe_path(params[:recipe_id])
  end

  private

  def recipe_params
    params.require(:recipe_food).permit(:food, :quantity, :recipe_id)
  end
end
