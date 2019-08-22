Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/new'
  devise_for :users
  resources :users, only: [:show]
  
  resources :posts do
    resources :likes
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "posts#index"
end
