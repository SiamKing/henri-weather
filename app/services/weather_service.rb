class WeatherService
  API_URL = "https://api.openweathermap.org/data/2.5/"
  UNITS = "imperial"

  def get_weather_by_zipcode(zipcode)
    conn = connect_to_weather_api
    resp = conn.get("weather", zip: zipcode, units: UNITS, appid: ENV["weather_app_id"])
  end

  private

  def connect_to_weather_api
    Faraday.new(url: API_URL)
  end
end
