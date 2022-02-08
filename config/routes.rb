Rails.application.routes.draw do
  get 'menus/index'
  get 'menus/new'
  get 'menus/create'
  get 'dishes/index'
  get 'dishes/new'
  get 'dishes/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
