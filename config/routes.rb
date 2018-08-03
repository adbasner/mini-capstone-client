Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'client/products#index'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  namespace :client do
    # CRUD routes
    # ---------------------------------
    get '/products/' => 'products#index'
    get '/products/new' => 'products#new'
    get '/products/:id' => 'products#show'
    post '/products/' => 'products#create'
    get '/products/:id/edit' => 'products#edit'
    patch '/products/:id' => 'products#update'
    delete '/products/:id' => 'products#destroy'

    # Login routes
    # ----------------------------------
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    delete '/logout' => 'sessions#destroy'

    # Order routes
    # ----------------------------------
    get '/orders/new' => 'orders#new'
    get 'orders/:id' => 'orders#show'
    post '/orders/' => 'orders#create'

    # Cart routes
    # ----------------------------------
    get '/carted_products/' => 'carted_products#index'
    get '/carted_products/new' => 'carted_products#new'
    get 'carted_products/:id' => 'carted_products#show'
    post '/carted_products/' => 'carted_products#create'
  end
end
