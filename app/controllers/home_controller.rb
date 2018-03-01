class HomeController < ApplicationController
  def index
    @recipes = Recipe.all
    @cuisines = Cuisine.all
    @recipe_types = RecipeType.all
  end

  def search
    @string = params[:string]

    @recipes = Recipe.where('title like ?', @string)
  end
end
