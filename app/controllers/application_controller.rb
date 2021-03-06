class ApplicationController < ActionController::Base
  before_action :set_locale
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  
  
 
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  
  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end
  
  private

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to home_url
      end
    end
    
    def admin_user
      unless is_admin?
        store_location
        flash[:danger] = "You are not an admin user."
        redirect_to home_url
      end
    end
end
