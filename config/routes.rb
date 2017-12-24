Rails.application.routes.draw do


    get '/regu', to: 'pages#regu', as: :regu
    devise_for :users
    root to: 'pages#index'
    resources :registeredapps
    namespace :api, defaults: { format: :json } do
      match '/events', to: 'events#preflight', via: [:options]
      resources :events, only: [:create]
    end
end
