class ShoppingListController < ApplicationController
    def index
        @food_list = []
        current_user.recipes.each do |recipe|
          @food_list.concat(recipe.foods)
        end
        @general_food_list = current_user.foods
        @missing_food_list = @general_food_list - @food_list
        @missing_food_list = @missing_food_list.select { |food| food.is_a?(Food) }
        @total_missing_items = @missing_food_list.count
        @total_missing_price = @missing_food_list.sum { |food| food.price }
        
    end

end