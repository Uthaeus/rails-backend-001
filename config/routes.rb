Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  devise_scope :user do
    put 'users/:id', to: 'users/registrations#update'
    delete 'users/:id', to: 'users/registrations#destroy'
  end

  get 'home', to: 'pages#home'
  get 'user_check', to: 'pages#user_check'
end
