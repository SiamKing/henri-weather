class Weather
  include ActiveModel::Model
  attr_accessor :current_temperature, :low_temperature, :high_temperature

  def average_temperature
    ((@low_temperature + @high_temperature) / 2)
  end

  def convert_temperatures
  end

  def convert_temperature_to_fahrenheit(temperature)
  end
end
