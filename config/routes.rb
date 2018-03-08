Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  get 'recipes/search', to: 'recipes#search', as: 'search'
  resources :recipes, only: [:show, :new, :create, :edit, :update, :destroy] do
      get 'list', on: :collection
  end
  resources :cuisines, only: [:show, :new, :create, :edit, :update]
  resources :recipe_types, only: [:show, :new, :create]
end
