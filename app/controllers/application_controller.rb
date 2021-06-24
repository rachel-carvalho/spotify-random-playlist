class ApplicationController < ActionController::Base
  private
  helper_method :user

  def user
    session[:user]
  end
end
