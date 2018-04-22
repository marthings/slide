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
    redirect_to @presentation, notice: "New Part Created!"
  end

  def update
    if @part.update(parts_params)
      redirect_to @presentation, notice: "Updated Succesfully!"
    else
      render :show, notice: "There was an error updating the part"
    end
    
  end

  def destroy
    @part.destroy
    title = @part.title

    if @part.destroy
      redirect_to @presentation, notice: "#{title} was deleted succesfully"
    else
      render :show, notice: "There was an error deleting the part"
    end

  end

  private
    def set_presentation
      @presentation = Presentation.find(params[:presentation_id])
      
    end

    def set_part
      @part = Part.find(params[:id])
      authorize @presentation
    end

    def parts_params
      params.required(:part).permit(:title, :id, :body)
    end
end
