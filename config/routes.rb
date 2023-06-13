Rails.application.routes.draw do
 root to: "homes#top"
 devise_for :users
 resources :users, only: [:index,:show,:edit,:update]
  resources :illusts, only: [:new,:index,:show,:edit,:create,:destroy,:update]
  get 'users/create'
  get 'users/destroy'
   devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
