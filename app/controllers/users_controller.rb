class UsersController < ApplicationController
  before_action :set_user

  def show
    @presentations = @user.presentations.all
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end