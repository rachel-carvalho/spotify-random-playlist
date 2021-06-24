class PlaylistsController < ApplicationController
  # POST /playlist
  def create
    user.create_randomized_playlist!
    redirect_to root_path, notice: "Playlist was successfully created."
  end

  # DELETE /playlist
  def destroy
    user.destroy_randomized_playlist!
    redirect_to root_path, notice: "Songs were removed from playlist and you unfollowed it."
  end
end
