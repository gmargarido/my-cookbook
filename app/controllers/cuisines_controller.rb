class CuisinesController < ApplicationController
  def show
    @cuisine = Cuisine.find(params[:id])
  end

  def new
    @cuisine = Cuisine.new
  end

  def create
    cuisine_params = params.require(:cuisine).permit(:name)

    @cuisine = Cuisine.new(cuisine_params)

    if @cuisine.save
      redirect_to @cuisine
    else
      flash[:error] = 'Você deve informar o nome da cozinha'
      render :new
    end
  end

  def edit
    @cuisine = Cuisine.find(params[:id])
  end

  def update
    cuisine_params = params.require(:cuisine).permit(:name)

    @cuisine = Cuisine.find(params[:id])

    if @cuisine.update(cuisine_params)
      redirect_to @cuisine
    else
      flash[:error] = 'Não foi possível atualizar a cozinha'
      render :edit
    end

  end
end
