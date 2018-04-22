class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  def index
  end

  def create
    super
    if @user.persisted?
      UserMailer.with(user: @user).welcome_email.deliver_later
    end
  end

  def after_sign_in_path_for(resource)
    presentations_path
  end

  def after_sign_up_path_for(resource)
    presentations_path
  end

  def after_update_path_for(resource)
    presentations_path
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :nickname])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :avatar, :nickname])
    end
end