class Weather
  include ActiveModel::Model
  attr_accessor :current_temperature, :low_temperature, :high_temperature

  def initialize(attributes)
    attributes.each { |key, val| send("#{key}=", val) }
  end

  def average_temperature
    ((@low_temperature.to_f + @high_temperature) / 2).round(2)
  end

  def convert_temperatures(units)
    if units == "F"
      as_json.each { |k, v| send("#{k}=", convert_temperature_to_fahrenheit(v)) }
    else
      as_json.each { |k, v| send("#{k}=", convert_temperature_to_celsius(v)) }
    end
  end

  def convert_temperature_to_fahrenheit(temp)
    ((temp.to_f * 9 / 5) + 32).round(2)
  end

  def convert_temperature_to_celsius(temp)
    ((temp.to_f - 32) * 5 / 9).round(2)
  end
end
