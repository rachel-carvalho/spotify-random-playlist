class UsersController < ApplicationController
  def spotify
    session[:user] = RSpotify::User.new(request.env['omniauth.auth'])
    redirect_to :root
  end
end
