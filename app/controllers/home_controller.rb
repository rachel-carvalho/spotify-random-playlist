class HomeController < ApplicationController
  def index
    @songs = user.all_songs
  end
end
