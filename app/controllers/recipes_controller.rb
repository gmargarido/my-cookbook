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

    recipe_params = params.require(:recipe).permit(:title, :recipe_type_id, :cuisine_id,
                                            :difficulty, :cook_time, :ingredients, :method)

    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to @recipe
    else
      flash[:error] = 'Você deve informar todos os dados da receita'
      render :new
    end
  end
end
