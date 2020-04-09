class WeatherController < ApplicationController
  def home
    @zipcodes = Location.pluck(:zipcode)
  end

  def current_weather
    @zipcode = params[:zipcode].presence || params[:zipcode_select].presence
    weather_service = WeatherService.new
    resp = weather_service.get_weather_by_zipcode(@zipcode)
    body = JSON.parse(resp.body, object_class: OpenStruct)

    if resp.success?
      @location = Location.new(zipcode: @zipcode)
      @zipcode_saved = Location.find_by(zipcode: @zipcode)
      temps = weather_service.parse_temps(body.main)
      @weather = Weather.new(temps)
      @units = "F"
      @convert_units_to = "C"
    else
      @error = body.message
      render "home"
    end
  end

  def convert_temperatures
    @zipcode = params[:zipcode]
    @units = params[:units]
    @weather = Weather.new(params[:temperatures])
    @weather.convert_temperatures(@units)
    @convert_units_to = @units == "F" ? "C" : "F"
    render "convert_temperatures"
  end
end
