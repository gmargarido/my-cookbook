require 'rails_helper'

feature "User don't create a duplicated recipe" do
  scenario 'successfully' do
    #cria os dados necessários, nesse caso não vamos criar dados no banco
    cuisine = Cuisine.create(name: 'Japonesa')

    # simula a ação do usuário
    visit root_path
    click_on 'Cadastrar uma cozinha'

    fill_in 'Nome', with: 'Japonesa'

    click_on 'Enviar'

    expect(page).to have_content('Name já foi utilizado')
  end
end
