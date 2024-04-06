Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get '/about', to:'homes#about'
  # For details on he DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :post_images, only: [:new,:create,:index,:show,:destroy] do
    resource :favorite, only: [:create, :destroy]
    resources :post_comments, only:[:create,:destroy]
    
  end 
  resources :users, only: [:show,:edit,:update]
end

