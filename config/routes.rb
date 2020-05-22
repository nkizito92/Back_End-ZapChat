Rails.application.routes.draw do
  
   # regular users
  #  get '/users', to: 'users#index'
  #  get '/login', to: 'users#login'
   get '/login', to: 'authentication#get_user_from_token'
   get '/login', to: 'authentication#get_user_from_token'
  #  post '/login', to: 'users#loggedin'
  #  post '/signup', to: 'users#create'
  #  get '/logout', to: 'users#logout'
 
  resources :comments
  resources :chats
  resources :guests
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
