class ApplicationController < ActionController::Base
  private
  helper_method :user

  def user
    return if !session || !session[:user]
    RSpotify::User.new(session[:user])
  end
end
