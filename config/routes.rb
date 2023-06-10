Rails.application.routes.draw do
 root to: "homes#top"
 devise_for :users
 resources :users, only: [:index,:show,:edit,:update]
  resources :illusts, only: [:index,:show,:edit,:create,:destroy,:update]
  get 'users/create'
  get 'users/destroy'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
