class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_current_user

  def after_sign_in_path_for(resource)
    presentations_path
  end

  def after_sign_up_path_for(resource)
    presentations_path
  end

  def after_sign_out_path_for(resource)
    pages_path("bye")
  end

  def after_update_path_for(resource)
    presentations_path
  end

  private

    def set_current_user
      Current.user = current_user
    end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :avatar, :nickname])
    end

end