class HomeController < ApplicationController
  def index
    @playlists = user&.playlists
  end
end
