class ShoppingListController < ApplicationController
  def index
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_foods = @recipe.recipe_food.includes([:food])
    @total = sum_total(@recipe_foods)
  end

  def sum_total(recipe_foods)
    total = 0
    recipe_foods.each do |item|
      total += item.food.price * item.quantity.to_i
    end
    total
  end
end
