require 'rails_helper'

feature 'Administrator edit a cuisine' do
  scenario 'successfully' do
    #criação dos dados
    cuisine = Cuisine.create(name: "Japonesa")

    #simula a ação do usuário
    visit root_path
    click_on cuisine.name
    click_on "Editar"

    fill_in 'Nome', with: "Chinesa"

    click_on "Enviar"

    #expectativa
    expect(page).to have_css('h1', cuisine.name)
  end

  scenario "and the field can't be blank" do
    #criação dos dados
    cuisine = Cuisine.create(name: "Japonesa")

    #simula a ação do usuário
    visit root_path
    click_on cuisine.name
    click_on "Editar"

    fill_in 'Nome', with: ''

    click_on "Enviar"

    #expectativa
    expect(page).to have_content("Name não pode estar em branco")

  end

  scenario "and can't create duplicated cuisine" do
    #criação dos dados
    cuisine = Cuisine.create(name: "Japonesa")
    other_cuisine = Cuisine.create(name: "Chinesa")

    #simula a ação do usuário
    visit root_path
    click_on other_cuisine.name
    click_on "Editar"

    fill_in 'Nome', with: 'Japonesa'

    click_on "Enviar"

    #expectativa
    expect(page).to have_content("Name já foi utilizado")
  end
end
