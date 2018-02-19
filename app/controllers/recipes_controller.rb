class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    @cuisines = Cuisine.all
  end

  def new
    @recipe = Recipe.new
    @cuisines = Cuisine.all
  end

  def create

    titulo = params[:recipe][:title]
    tipo = params[:recipe][:recipe_type]
    cozinha = params[:recipe][:cuisine_id]
    dificuldade = params[:recipe][:difficulty]
    tempo = params[:recipe][:cook_time]
    ingredientes = params[:recipe][:ingredients]
    metodo = params[:recipe][:method]

    recipe = Recipe.new(title: titulo, recipe_type: tipo,
      cuisine_id: cozinha, difficulty: dificuldade,
      cook_time: tempo, ingredients: ingredientes, method: metodo)

    recipe.save

    @last_recipe = Recipe.last.id
    redirect_to recipe_url(@last_recipe)

  end
end
