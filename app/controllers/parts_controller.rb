class PartsController < ApplicationController
  before_action :set_presentation

  def show
  end

  def edit
    @part = Part.find(params[:id])
  end

  def create
    @presentation.parts.create! parts_params
    redirect_to @presentation
  end

  def update
    @part = Part.find(params[:id])
    @part.update(parts_params)
    redirect_to @presentation
  end

  private
    def set_presentation
      @presentation = Presentation.find(params[:presentation_id])
    end

    def parts_params
      params.required(:part).permit(:title, :id)
    end
end
