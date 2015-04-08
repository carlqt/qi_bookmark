class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u|
      u.permit(:password, :password_confirmation, :current_password, :username, :name, :avatar)
    }
  end

  def after_sign_in_path_for(resource)
    user_path(current_user.slug)
  end


end
