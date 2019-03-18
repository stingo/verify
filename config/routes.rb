Rails.application.routes.draw do
  #get 'users/index'
  #get 'users/new'
  #get 'users/create'
  #get 'users/show'
  #get 'users/challenge'
  #get 'users/verify'
  #get 'users/success'

    resources :users, :only => [:new, :create] do |p|
    collection do
      get 'challenge'
      post 'verify'
      get 'success'
    end
end





  devise_for :users
  #devise_for :users, controllers: { sessions: "sessions" }
  resources :posts
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'posts#index'
end
