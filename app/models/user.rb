class User
  RANDOMIZED_PLAYLIST_NAME = 'Randomized Liked Songs'

  attr_reader :spotify_user

  delegate :display_name, to: :spotify_user

  def initialize(spotify_user)
    @spotify_user = spotify_user
  end

  def all_songs
    @songs ||= all_pages(:saved_tracks)
  end

  def playlists
    @playlists ||= all_pages(:playlists)
  end

  def randomized_playlist
    @randomized_playlist ||= playlists.find do |playlist|
      playlist.name == RANDOMIZED_PLAYLIST_NAME
    end
  end

  def create_randomized_playlist!
    spotify_user.create_playlist!(RANDOMIZED_PLAYLIST_NAME, public: false).tap do |playlist|
      all_songs.shuffle.each_slice(100) do |slice|
        playlist.add_tracks!(slice)
      end
    end
  end

  def destroy_randomized_playlist!
    randomized_playlist.replace_tracks!([])
    spotify_user.unfollow(randomized_playlist)
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
