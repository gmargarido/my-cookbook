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

    @recipe = Recipe.new(title: titulo, recipe_type: tipo,
      cuisine_id: cozinha, difficulty: dificuldade,
      cook_time: tempo, ingredients: ingredientes, method: metodo)

    if @recipe.save
      redirect_to recipe_url(@recipe)
    else
      flash[:error] = 'Você deve informar todos os dados da receita'
      render :new
    end
  end
end
