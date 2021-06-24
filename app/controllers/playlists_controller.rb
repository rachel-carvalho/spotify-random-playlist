class PlaylistsController < ApplicationController
  # GET /playlist
  def show
    @playlist = user.randomized_playlist
  end

  # POST /playlist
  def create
    user.create_randomized_playlist!
    redirect_to :playlist, notice: "Playlist was successfully created."
  end

  # DELETE /playlist
  def destroy
    user.destroy_randomized_playlist!
    redirect_to root_path, notice: "Playlist was successfully destroyed."
  end
end
