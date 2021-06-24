Rails.application.routes.draw do
  get '/auth/spotify/callback', to: 'users#spotify'
  root to: 'home#index'
end
