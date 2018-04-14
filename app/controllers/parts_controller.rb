class PartsController < ApplicationController
  before_action :set_presentation
  before_action :set_part, except: [:new, :create]

  def show
  end

  def new
    @part = Part.new
  end

  def edit
    
  end

  def create
    @presentation.parts.create(parts_params)
    redirect_to @presentation
  end

  def update
    if @part.update(parts_params)
      flash[:notice] = "Updated succesfully!"
      redirect_to @presentation
    else
      flash[:error] = "There was an error updating the part"
      render :show
    end
    
  end

  def destroy
    @part.destroy
    title = @part.title

    if @part.destroy
      flash[:notice] = "#{title} was deleted succesfully"
      redirect_to @presentation
    else
      flash[:error] = "There was an error deleting the part"
      render :show
    end

  end

  private
    def set_presentation
      @presentation = Presentation.find(params[:presentation_id])
    end

    def set_part
      @part = Part.find(params[:id])
    end

    def parts_params
      params.required(:part).permit(:title, :id)
    end
end
