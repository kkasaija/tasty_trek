class RecipesController < ApplicationController
  def index
    if user_signed_in?
      @recipes = current_user.recipes
    else
      redirect_to new_user_session_path
    end
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create!(recipe_params.merge(user: current_user))
    redirect_to recipes_path
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

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time, :public, :current_user)
  end
end
