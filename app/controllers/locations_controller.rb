class LocationsController < ApplicationController
  def create
    @location = Location.new(location_params)
    if @location.save
      @zipcode_saved = true
      render "location"
    else
      @error = "Something went wrong"
      render "location"
    end
  end

  private

  def location_params
    params.require(:location).permit(:zipcode)
  end
end
