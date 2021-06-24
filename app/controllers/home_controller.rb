class HomeController < ApplicationController
  def index
    @songs = songs
  end

  private

  def songs
    return [] unless user
    tracks = []
    limit = 50
    loop do
      page = user.saved_tracks(limit: limit, offset: tracks.count)
      return tracks if page.count.zero?
      tracks += page
    end
  end
end
