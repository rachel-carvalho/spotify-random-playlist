
credentials = OpenStruct.new(Rails.application.credentials.spotify)
RSpotify::authenticate(credentials.client_id, credentials.client_secret)
