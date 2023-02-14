class RecipesController < ApplicationController
    def index
        current_user
        @recipes = current_user.recipes
    end

    def show
        @recipe = Recipe.find(params[:id])
    end

    def destroy 
        @recipe = Recipe.find(params[:id])
        RecipeFood.where(recipe_id: @recipe.id).destroy_all
        @recipe.destroy!
        redirect_to recipes_path
    end
end
