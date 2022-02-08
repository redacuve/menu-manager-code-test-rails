Rails.application.routes.draw do
  resources :menus, only: [:index, :new, :create]
  resources :dishes, only: [:index, :new, :create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "menus#index", defaults: { format: 'json' }
end
