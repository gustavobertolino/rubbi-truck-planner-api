Rails.application.routes.draw do
  resources :legs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :truck
  resources :driver
  resources :container
  resources :route
  resources :order
  resources :order_item
end
