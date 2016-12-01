class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  autocomplete :profile, :name
  before_filter :require_login
  
  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end
  
  private

  def require_login
    unless current_user
      redirect_to('/')
    end
  end
  
  
end