class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  # Basic HTTP authentication
  # before_action :authenticate

  # Google oauth
  before_action :authenticate_user

  def current_user
    @current_user ||= User.find(session[:user_id]) rescue nil
  end

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "lbraun" && password == "generosity window gopher chop"
    end
  end

  def authenticate_user
    if current_user
      unless current_user.approved? || params[:controller] == "sessions" && params[:action] == "destroy"
        flash.alert = "Your account must be approved by an administrator to continue"
        redirect_to root_path
      end
    else
      flash.alert = "Please sign in to continue"
      redirect_to root_path
    end
  end

  def render_404
    raise ActiveRecord::RecordNotFound
  end
end
