Rails.application.routes.draw do
  devise_for :members
  devise_for :users
  resources :uniusers
  resources :managers do
    collection do
      get :check_out, path: 'check_out/:id'
      get :buy_record, path: 'buy_record/:id'
    end
  end
  resources :products
  resources :categories do
  	resources :products, :controller => 'categories'
  end
  resources :buy_records
  root :to => "managers#home"
  get '/show_date' => 'managers#show_date', :as => "show_date"
  patch 'product_update/:id' => 'categories#product_update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :cart, only:[:show, :destroy] do
    collection do
      post :add, path: 'add/:id'
    end
  end
  post '/save_and_destroy' => 'carts#save_and_destroy'
  get '/check_stock' => 'managers#check_stock', :as => "check_stock"
  patch '/update_stock' => 'managers#update_stock', :as => "update_stock"
  patch '/add_user_money' => 'uniusers#add_user_money', :as => "add_user_money"
end
