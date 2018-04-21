class Presentations::LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_presentation

  def create
    @presentation.likes.where(user_id: current_user.id).first_or_create

    respond_to do |format|
      format.html { redirect_to @presentation }
      format.js
    end
  end

  def destroy
    @presentation.likes.where(user_id: current_user.id).destroy_all

    respond_to do |format|
      format.html { redirect_to @presentation }
      format.js
    end
  end
  
  private
    def set_presentation
      @presentation = Presentation.find(params[:presentation_id])
    end
end