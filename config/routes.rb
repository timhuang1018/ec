Rails.application.routes.draw do
  devise_for :users
  resource :mains
  resources :managers
  resources :products
  root :to => "managers#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
