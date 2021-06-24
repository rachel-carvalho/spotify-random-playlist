class User
  attr_reader :spotify_user

  delegate :display_name, to: :spotify_user

  def initialize(spotify_user)
    @spotify_user = spotify_user
  end

  def all_songs
    tracks = []
    limit = 50
    loop do
      page = spotify_user.saved_tracks(limit: limit, offset: tracks.count)
      tracks += page
      return tracks if page.count < limit
    end
  end
end
