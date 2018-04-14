class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  
  
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me, :display_name, :description, :number) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :current_password, :password_confirmation, :remember_me, :avatar, :display_name, :username, :description, :number, :bg, :hex) }
  end
  
  def update_resource(resource, params)
    params.delete :current_password
    resource.update_without_password(params)
  end
end
