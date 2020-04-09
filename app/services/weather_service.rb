class WeatherService
  API_URL = "https://api.openweathermap.org/data/2.5/"
  UNITS = "imperial"

  def get_weather_by_zipcode(zipcode)
    conn = connect_to_weather_api
    resp = conn.get("weather", zip: zipcode, units: UNITS, appid: ENV["weather_app_id"])
  end

  def parse_temps(body)
    { current_temperature: body.temp, low_temperature: body.temp_min, high_temperature: body.temp_max }
  end

  private

  def connect_to_weather_api
    Faraday.new(url: API_URL)
  end
end
