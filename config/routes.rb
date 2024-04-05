Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get '/about', to:'homes#about'
  # For details on he DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :post_images, only: [:new, :index, :show]
  
end

