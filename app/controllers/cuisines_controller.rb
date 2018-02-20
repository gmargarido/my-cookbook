class CuisinesController < ApplicationController
  def show
    @cuisine = Cuisine.find(params[:id])
  end

  def new
    @cuisine = Cuisine.new
  end

  def create
    name = params[:cuisine][:name]

    @cuisine = Cuisine.new(name: name)

    if @cuisine.save
      redirect_to cuisine_url(@cuisine)
    else
      flash[:error] = 'Você deve informar o nome da cozinha'
      render :new
    end
  end
end
