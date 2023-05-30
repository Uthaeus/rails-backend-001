Rails.application.routes.draw do


  get 'home', to: 'pages#home'
  get 'user_check', to: 'pages#user_check'
end
