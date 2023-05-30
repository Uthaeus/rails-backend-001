Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }


  get 'home', to: 'pages#home'
  get 'user_check', to: 'pages#user_check'
end
