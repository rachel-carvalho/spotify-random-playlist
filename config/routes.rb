Rails.application.routes.draw do
  get '/auth/spotify/callback', to: 'sessions#create'
  delete '/session', to: 'sessions#destroy', as: :logout
  resource :playlist, only: %i[show create destroy]
  root to: 'home#index'
end
