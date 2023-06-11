Rails.application.routes.draw do
  resources :comments
  resources :blogs
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  devise_scope :user do
    put 'users/:id', to: 'users/registrations#update'
    delete 'users/:id', to: 'users/registrations#destroy'
  end

  resources :liked_quotes, only: [:create, :destroy]

  get 'home', to: 'pages#home'
  get 'user_check', to: 'pages#user_check'
  get 'user_detail/:id', to: 'pages#user_detail'
end
