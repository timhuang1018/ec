Rails.application.routes.draw do
  devise_for :members
  devise_for :users
  resources :uniusers
  resources :managers
  resources :products
  resources :categories
  root :to => "managers#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
