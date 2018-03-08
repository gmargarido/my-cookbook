require 'rails_helper'

feature 'User view last recipes on homepage' do
  scenario 'successfully' do
    #criação dos dados
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe_type = RecipeType.create(name: 'Sobremesa')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                          cuisine: cuisine, difficulty: 'Médio', cook_time: 60,
                          ingredients: 'Farinha, açucar, cenoura',
                          method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')


    recipe2 = Recipe.create(title: 'Bolo de fubá', recipe_type: recipe_type,
                          cuisine: cuisine, difficulty: 'Médio', cook_time: 60,
                          ingredients: 'Farinha, açucar, cenoura',
                          method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

    recipe3 = Recipe.create(title: 'Bolo de chocolate', recipe_type: recipe_type,
                          cuisine: cuisine, difficulty: 'Médio', cook_time: 60,
                          ingredients: 'Farinha, açucar, cenoura',
                          method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')


    recipe4 = Recipe.create(title: 'Pudim', recipe_type: recipe_type,
                          cuisine: cuisine, difficulty: 'Médio', cook_time: 60,
                          ingredients: 'Farinha, açucar, cenoura',
                          method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

    recipe5 = Recipe.create(title: 'Bolo de coco', recipe_type: recipe_type,
                          cuisine: cuisine, difficulty: 'Médio', cook_time: 60,
                          ingredients: 'Farinha, açucar, cenoura',
                          method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')


    recipe6 = Recipe.create(title: 'Bolo de milho', recipe_type: recipe_type,
                          cuisine: cuisine, difficulty: 'Médio', cook_time: 60,
                          ingredients: 'Farinha, açucar, cenoura',
                          method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

    #navegação do usuário
    visit root_path

    #expectativas
    expect(page).to have_css("h3", text: "Últimas receitas")
    expect(page).to have_css("h4", text: recipe.title)
    expect(page).to have_css("li", text: recipe.recipe_type.name)
    expect(page).to have_css("li", text: recipe.cuisine.name)
    expect(page).to have_css("h4", text: recipe2.title)
    expect(page).to have_css("li", text: recipe2.recipe_type.name)
    expect(page).to have_css("li", text: recipe2.cuisine.name)
    expect(page).to have_css("h4", text: recipe3.title)
    expect(page).to have_css("li", text: recipe3.recipe_type.name)
    expect(page).to have_css("li", text: recipe3.cuisine.name)
    expect(page).to have_css("h4", text: recipe4.title)
    expect(page).to have_css("li", text: recipe4.recipe_type.name)
    expect(page).to have_css("li", text: recipe4.cuisine.name)
    expect(page).to have_css("h4", text: recipe5.title)
    expect(page).to have_css("li", text: recipe5.recipe_type.name)
    expect(page).to have_css("li", text: recipe5.cuisine.name)
    expect(page).to have_css("h4", text: recipe6.title)
    expect(page).to have_css("li", text: recipe6.recipe_type.name)
    expect(page).to have_css("li", text: recipe6.cuisine.name)
  end
end
