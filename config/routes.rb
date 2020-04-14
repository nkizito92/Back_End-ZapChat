Rails.application.routes.draw do
  resources :images
  resources :chats
  resources :guests
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
