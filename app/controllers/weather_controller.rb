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
      byebug
    else
      @error = body.message
      render "home"
    end
  end
end
