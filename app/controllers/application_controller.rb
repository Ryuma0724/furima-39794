class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :given_name, :family_name_kana, :given_name_kana, :birthday])

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == '39794' && password == '39794' 
    end
  end
end
