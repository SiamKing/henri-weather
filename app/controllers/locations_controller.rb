class LocationsController < ApplicationController
  def create
    @location = Location.new(location_params)
    if @location.save
      @location.zipcode_saved = true
      render "location"
    else
      @error = "Whoops. Something went wrong. Please try again."
      render "location"
    end
  end

  private

  def location_params
    params.require(:location).permit(:zipcode)
  end
end
