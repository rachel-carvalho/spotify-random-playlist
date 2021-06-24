Rails.application.routes.draw do
  get '/auth/spotify/callback', to: 'sessions#create'
  delete '/session', to: 'sessions#destroy', as: :logout
  root to: 'home#index'
end
