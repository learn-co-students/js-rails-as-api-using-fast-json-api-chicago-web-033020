class SightingsController < ApplicationController
  def show
    sighting = Sighting.find_by(params[:id])
    options = {
      include: [:bird, :location]
    }
    # render json: sighting.to_json(:include => {:bird => {:only =>[:name, :species]}, :location => {:only =>[:latitude, :longitude]}}, :except => [:updated_at])
    render json: SightingSerializer.new(sighting, options)
  end
end
