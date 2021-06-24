class User
  attr_reader :spotify_user

  delegate :display_name, to: :spotify_user

  def initialize(spotify_user)
    @spotify_user = spotify_user
  end

  def all_songs
    all_pages(:saved_tracks)
  end

  def playlists
    all_pages(:playlists)
  end

  private

  def all_pages(method_name)
    tracks = []
    limit = 50
    loop do
      page = spotify_user.public_send(method_name, limit: limit, offset: tracks.count)
      tracks += page
      return tracks if page.count < limit
    end
  end
end
