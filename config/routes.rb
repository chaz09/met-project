Rails.application.routes.draw do
  get '/regu', to: 'pages#regu', as: :regu
  devise_for :users
root to: 'pages#index'
resources :registeredapps
end
