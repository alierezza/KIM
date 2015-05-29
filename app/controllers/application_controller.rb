class ApplicationController < ActionController::Base
  include ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?
  

  def after_sign_in_path_for(resource)
    dashboards_path #your path
  end

  def after_sign_out_path_for(resource_or_scope)
    if params[:reset_password]
        @user = User.find(params[:reset_password])
        token = SecureRandom.hex(10)
        @user.reset_password_token = Devise.token_generator.digest(self, :reset_password_token, token)
        @user.reset_password_sent_at = Time.now
        @user.save
        "http://#{request.env['HTTP_HOST']}/users/password/edit?reset_password_token=" + token
    else
      "http://#{request.env['HTTP_HOST']}"
    end
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email) }
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation) }
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

end
