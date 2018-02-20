class CuisinesController < ApplicationController
  def show
    @cuisine = Cuisine.find(params[:id])
  end

  def new
    @cuisine = Cuisine.new
  end

  def create
    name = params[:cuisine][:name]

    cuisine = Cuisine.new(name: name)

    if cuisine.save
      @last_cuisine = Cuisine.last.id
      redirect_to cuisine_url(@last_cuisine)
    else
      redirect_to new_cuisine_url
    end
  end
end
