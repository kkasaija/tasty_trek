class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @public_recipes = Recipe.where(public: true).order('created_at DESC')
  end
end
