require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  credentials = OpenStruct.new(Rails.application.credentials.spotify)
  scopes = 'user-read-email playlist-read-private playlist-modify-private user-library-read'
  provider :spotify, credentials.client_id, credentials.client_secret, scope: scopes
end
