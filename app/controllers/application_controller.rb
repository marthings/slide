class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :set_current_user

  private

    # This cant be in registrations_controller for some reason
    def after_sign_out_path_for(resource)
      new_user_session_path
    end

    # Current user available "globally"
    def set_current_user
      Current.user = current_user
    end

end