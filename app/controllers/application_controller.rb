class ApplicationController < ActionController::Base
  private
  helper_method :user

  def user
    return if !session || !session[:user]
    @user ||= User.new(RSpotify::User.new(session[:user]))
  end
end
