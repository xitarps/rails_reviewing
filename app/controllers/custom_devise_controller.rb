class CustomDeviseController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    attributes = [:email, :password, :password_confirmation, :remember_me,
                  :username, :first_name, :last_name]
    devise_parameter_sanitizer.permit :sign_up, keys: attributes
    devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password]
    devise_parameter_sanitizer.permit :account_update, keys: attributes
  end
end
