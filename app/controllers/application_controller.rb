class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private
  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action."
    redirect_to root_path
  end

  protected
  def configure_permitted_parameters  #for devise
    added_attrs = [:name, :title, :phone, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
