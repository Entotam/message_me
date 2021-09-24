Rails.application.routes.draw do
  
  root 'chatroom#index'
  get 'login', to: 'session#new'
  post 'login', to: 'sessions#create'
  
end
