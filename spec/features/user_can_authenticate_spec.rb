require 'rails_helper'

feature 'User can authenticate' do
  scenario 'successfully' do
    user = User.create(email: 'felix@gmail.com', password: '12345678')

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Logar'

    expect(page).to have_css('nav', text: "Bem-vindo felix@gmail.com")
    expect(page).not_to have_link('Entrar')
    expect(page).to have_link('Sair')
  end
  scenario 'and logout' do
    user = User.create(email: 'felix@gmail.com', password: '12345678')

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Logar'
    click_on 'Sair'

    expect(page).to have_link('Entrar')
    expect(page).not_to have_link('Sair')
  end

  scenario 'and view the recipe owner' do

  end
end
