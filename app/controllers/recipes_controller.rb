class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
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

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    recipe_params = params.require(:recipe).permit(:title, :recipe_type_id, :cuisine_id,
                                            :difficulty, :cook_time, :ingredients, :method)

    id = params[:id]
    @recipe = Recipe.find(id)
    update = @recipe.update(recipe_params)


    if update
      redirect_to recipe_path(id)
    else
      flash[:error] = 'Você deve informar todos os dados da receita'
      render :edit
    end
  end
end
