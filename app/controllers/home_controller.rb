class HomeController < ApplicationController
  def index
    @cuisines = Cuisine.all
    @recipe_types = RecipeType.all
    @last_recipes = Recipe.last(6)
  end
end
