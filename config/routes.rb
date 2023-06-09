Rails.application.routes.draw do
  get 'illusts/index'
  get 'illusts/edit'
  get 'illusts/show'
  get 'illusts/create'
  get 'illusts/update'
  get 'illusts/destroy'
 root to: "homes#top"
 resources :users, only: [:index,:show,:edit,:update]
  resources :illustrats, only: [:index,:show,:edit,:create,:destroy,:update]
  get 'users/create'
  get 'users/destroy'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
