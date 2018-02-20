class HomeController < ApplicationController
  def index
    @recipe = Recipe.all
    @cuisines = Cuisine.all
  end
end
