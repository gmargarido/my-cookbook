class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @recipe_types = RecipeType.all
    @cuisines = Cuisine.all
  end

  def create

    recipe_params = params.require(:recipe).permit(:title, :recipe_type_id, :cuisine_id,
                                            :difficulty, :cook_time, :ingredients, :method)

    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to @recipe
    else
      @recipe_types = RecipeType.all
      @cuisines = Cuisine.all
      flash[:error] = 'Você deve informar todos os dados da receita'
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @recipe_types = RecipeType.all
    @cuisines = Cuisine.all
  end

  def update
    recipe_params = params.require(:recipe).permit(:title, :recipe_type_id, :cuisine_id,
                                            :difficulty, :cook_time, :ingredients, :method)

    id = params[:id]
    @recipe = Recipe.find(id)

    if @recipe.update(recipe_params)
      redirect_to recipe_path(id)
    else
      @recipe_types = RecipeType.all
      @cuisines = Cuisine.all
      flash[:error] = 'Você deve informar todos os dados da receita'
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])

    @recipe.delete

    redirect_to root_path
  end
end
