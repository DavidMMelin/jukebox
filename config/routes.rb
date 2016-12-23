Rails.application.routes.draw do
  root 'tracks#index'

  resources :tracks, only: [:create, :index]

  namespace :api, defaults: {format: 'json' } do
    resources :tracks, only: [:create, :index]
  end
end
