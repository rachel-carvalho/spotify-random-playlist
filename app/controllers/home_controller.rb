class HomeController < ApplicationController
  def index
    @songs = user&.all_songs || []
    @playlists = user&.playlists || []
  end
end
