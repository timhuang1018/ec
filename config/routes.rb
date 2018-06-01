Rails.application.routes.draw do
<<<<<<< HEAD
  devise_for :members
  devise_for :users
  resources :uniusers
  resources :managers
  resources :products
  resources :categories do
  	resources :products, :controller => 'categories'
  end
  root :to => "managers#home"
  get '/show_date' => 'managers#show_date', :as => "show_date"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get"/", to: "pages#hello"

end
