Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :songs, only: [:index, :show]
  resources :super_fans, only: [:index, :destroy]
  resources :reviews, only: [:create]
end
