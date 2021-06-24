class SessionsController < ApplicationController
  def create
    session[:user] = RSpotify::User.new(request.env['omniauth.auth'])
    redirect_to :root
  end

  def destroy
    reset_session
    redirect_to :root
  end
end
