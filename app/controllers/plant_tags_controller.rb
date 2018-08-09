class PlantTagsController < ApplicationController
  def new
    @plant = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new
  end

  def create
    @plant = Plant.find(params[:plant_id])
    # @plant_tag = @plant.plant_tags.new(plant_tag_params)
    # if @plant_tag.save
    #   redirect_to garden_path(@plant.garden)
    # else
    #   render :new
    # end
    @tag_ids = plant_tag_params[:tag_id]
    @tag_ids.each do |tag_id|
      @plant_tag = @plant.plant_tags.new(tag_id: tag_id)
      @plant_tag.save
      redirect_to garden_path(@plant.garden)
    end
  end

  private

  def plant_tag_params
    params.require(:plant_tag).permit( tag_id: [] )
  end
end
