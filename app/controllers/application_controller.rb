class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def after_sign_in_path_for(resource)
  session[:return_to] || users_url
end












  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_up) do |profile_params|
      profile_params.permit(:firstname, :lastname, :email, :password, :password_confirmation, :mobile_number, :phone_number, :country_code )
    end

    devise_parameter_sanitizer.permit(:account_update) do |profile_params|
      profile_params.permit(:firstname, :lastname, :email, :password, :password_confirmation, :mobile_number, :phone_number, :country_cod )
    end

    # devise_parameter_sanitizer(:sign_in) { |u| u.permit(:first_name, :last_name, :email, :password, :remember_me) }
  end
end
