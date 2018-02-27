require 'rails_helper'

feature 'User remove a recipe' do
  scenario 'successfully' do
    #cria os dados necessários para o teste
    cuisine = Cuisine.create(name: 'Japonesa')
    recipe_type = RecipeType.create(name: 'Entrada')
    recipe = Recipe.create(title: 'Sunomono', cook_time: 20, recipe_type: recipe_type,
                          difficulty: 'Fácil', ingredients: 'Pepino, sal, vinagre de arroz, açúcar, gergelim',
                        cuisine: cuisine, method: 'Corte o pepino em fatias bem finas, misture todos
                        os ingredientes e complemente com gergilim')

    #simula a ação do usuário
    visit root_path
    click_on recipe.title
    click_on 'Remover'

    expect(current_path).to eq(root_path)
  end
end
