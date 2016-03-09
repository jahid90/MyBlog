Rails.application.routes.draw do

  authenticated :user do
    root 'posts#index', as: 'authenticated_root'
  end

  root 'pages#home'

  get '/posts', to: 'pages#posts'

  devise_for :users

  resources :posts do
    resources :comments, except: :index
  end
end
