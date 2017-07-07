class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  protect_from_forgery unless: -> { request.format.json? }

  before_action :configure_permitted_parameters, if: :devise_controller?

	rescue_from CanCan::AccessDenied do |exception|
		redirect_to main_app.root_url, notice: exception.message
	end
  protected
	def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:city_id, :name, :email, :password])
	    devise_parameter_sanitizer.permit(:account_update, keys: [:city_id, :avatar, :name, :city, :email, :password, :password_confirmation, :current_password])
	end
end
