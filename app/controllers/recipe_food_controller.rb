class RecipeFoodController < ApplicationController
  before_action :authenticate_user!
  def destroy
    @ingredient = RecipeFood.find(params[:id])
    @ingredient.destroy

    redirect_to recipe_path(params[:recipe_id])
  end
end
