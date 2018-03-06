require 'rails_helper'

feature 'Visitor find recipes' do
  scenario 'successfully' do
    #cria os dados necessários para o teste
    cuisine = Cuisine.create(name: "Japonesa")
    recipe_type = RecipeType.create(name: "Entrada")
    recipe = Recipe.create(title: 'Uramaki', cook_time: 15, recipe_type: recipe_type,
                          difficulty: 'Fácil', ingredients: 'Pepino, sal, vinagre de arroz, açúcar, gergelim',
                        cuisine: cuisine, method: 'Corte o pepino em fatias bem finas, misture todos
                        os ingredientes e complemente com gergilim')

    recipe = Recipe.create(title: 'Temaki', cook_time: 15, recipe_type: recipe_type,
                          difficulty: 'Fácil', ingredients: 'Folha de alga, peixe a gosto, arroz, cream cheese, cebolinha',
                        cuisine: cuisine, method: 'Separe a alga numa superfície plana, preencha metade dela com o arroz,
                        complete com o peixe e os codimentos (cream cheese e cebolinha) e feche a alga num formato de cone')

    #simula a navegação do usuário
    visit root_path

    fill_in 'Busca', with: 'maki'

    #expectativa
    expect(page).to have_content("Uramaki")
    expect(page).to have_content("Temaki")
  end

  scenario 'from home page' do
    # cria os dados necessários previamente
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe_type = RecipeType.create(name: 'Sobremesa')
    another_recipe_type = RecipeType.create(name: 'Entrada')

    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                           cuisine: cuisine, difficulty: 'Médio',
                           cook_time: 60,
                           ingredients: 'Farinha, açucar, cenoura',
                           method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

    another_recipe = Recipe.create(title: 'Salada de cenoura', recipe_type: another_recipe_type,
                           cuisine: cuisine, difficulty: 'Facil',
                           cook_time: 60,
                           ingredients: 'Cenoura e legumes',
                           method: 'Cozinhe a cenoura, misture com os legumes')

    # simula a ação do usuário
    visit root_path
    fill_in 'Busca', with: 'Bolo de cenoura'
    click_on 'Buscar'

    # expectativas do usuário após a ação
    expect(page).to have_css('h1', text: 'Resultado da busca por: Bolo de cenoura')
    expect(page).to have_css('h1', text: recipe.title)
    expect(page).to have_css('li', text: recipe.recipe_type.name)
    expect(page).to have_css('li', text: recipe.cuisine.name)
    expect(page).to have_css('li', text: recipe.difficulty)
    expect(page).to have_css('li', text: "#{recipe.cook_time} minutos")
    expect(page).not_to have_css('h1', text: another_recipe.title)
  end

  scenario 'and navigate to recipe details' do
    # cria os dados necessários previamente
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe_type = RecipeType.create(name: 'Sobremesa')

    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                           cuisine: cuisine, difficulty: 'Médio',
                           cook_time: 60,
                           ingredients: 'Farinha, açucar, cenoura',
                           method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

    # simula a ação do usuário
    visit root_path
    fill_in 'Busca', with: 'Bolo de cenoura'
    click_on 'Buscar'
    click_on 'Bolo de cenoura'

    # expectativas do usuário após a ação
    expect(current_path).to eq(recipe_path(recipe))
  end
end
