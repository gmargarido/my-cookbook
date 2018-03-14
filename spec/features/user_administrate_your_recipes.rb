require 'rails_helper'

feature 'User administrate your recipes' do
  scenario 'and must be logged to edit'
    #Criação dos dados
    user = User.create(email: 'felix@gmail.com', password: '12345678')
    other_user = User.create(email: 'glauco@gmail.com', password: '12345678')
    arabian_cuisine = Cuisine.create(name: 'Arabe')
    main_type = RecipeType.create(name: 'Prato Principal')

    recipe = Recipe.create(title: 'Tabule', recipe_type: main_type,
                          cuisine: arabian_cuisine, difficulty: 'Médio',
                          cook_time: 50,
                          ingredients: 'Farinha, açucar, cenoura',
                          method: 'Cozinhe a cenoura, corte em pedaços pequenos,
                          misture com o restante dos ingredientes',
                          user: user)

    other_recipe = Recipe.create(title: 'Kibe creu', recipe_type: main_type,
                          cuisine: arabian_cuisine, difficulty: 'Médio',
                          cook_time: 50,
                          ingredients: 'Farinha, açucar, cenoura',
                          method: 'Cozinhe a cenoura, corte em pedaços pequenos,
                          misture com o restante dos ingredientes',
                          user: other_user)
    #Navegação
    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Logar'
    click_on 'Receitas cadastradas'

    click_on recipe.title

    #Expectativa
    expect(page).to have_css('a', text: 'Editar')
  end

  scenario "and can't edit recipe from other user"
    #Criação dos dados
    user = User.create(email: 'felix@gmail.com', password: '12345678')
    other_user = User.create(email: 'glauco@gmail.com', password: '12345678')
    arabian_cuisine = Cuisine.create(name: 'Arabe')
    main_type = RecipeType.create(name: 'Prato Principal')

    recipe = Recipe.create(title: 'Tabule', recipe_type: main_type,
                          cuisine: arabian_cuisine, difficulty: 'Médio',
                          cook_time: 50,
                          ingredients: 'Farinha, açucar, cenoura',
                          method: 'Cozinhe a cenoura, corte em pedaços pequenos,
                          misture com o restante dos ingredientes',
                          user: user)

    other_recipe = Recipe.create(title: 'Kibe creu', recipe_type: main_type,
                          cuisine: arabian_cuisine, difficulty: 'Médio',
                          cook_time: 50,
                          ingredients: 'Farinha, açucar, cenoura',
                          method: 'Cozinhe a cenoura, corte em pedaços pequenos,
                          misture com o restante dos ingredientes',
                          user: other_user)
    #Navegação
    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Logar'
    click_on 'Receitas cadastradas'

    click_on other_recipe.title

    #Expectativa
    expect(page).not_to have_css('a', text: 'Editar')
  end

  scenario "and can't access other_recipe edit method directly"
  #Criação dos dados
  user = User.create(email: 'felix@gmail.com', password: '12345678')
  other_user = User.create(email: 'glauco@gmail.com', password: '12345678')
  arabian_cuisine = Cuisine.create(name: 'Arabe')
  main_type = RecipeType.create(name: 'Prato Principal')

  recipe = Recipe.create(title: 'Tabule', recipe_type: main_type,
                        cuisine: arabian_cuisine, difficulty: 'Médio',
                        cook_time: 50,
                        ingredients: 'Farinha, açucar, cenoura',
                        method: 'Cozinhe a cenoura, corte em pedaços pequenos,
                        misture com o restante dos ingredientes',
                        user: user)

  other_recipe = Recipe.create(title: 'Kibe creu', recipe_type: main_type,
                        cuisine: arabian_cuisine, difficulty: 'Médio',
                        cook_time: 50,
                        ingredients: 'Farinha, açucar, cenoura',
                        method: 'Cozinhe a cenoura, corte em pedaços pequenos,
                        misture com o restante dos ingredientes',
                        user: other_user)
  #Navegação
  visit root_path
  click_on 'Entrar'
  fill_in 'Email', with: user.email
  fill_in 'Senha', with: user.password
  click_on 'Logar'
  click_on 'Receitas cadastradas'

  visit edit_recipe_path(other_recipe)

  #Expectativa
  expect(page).to have_content('Bem-vindo ao maior livro de receitas online')
  end
end
