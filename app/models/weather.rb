class Weather
  include ActiveModel::Model
  attr_accessor :current_temperature, :low_temperature, :high_temperature, :units, :zipcode

  def initialize(attributes, units = "F", zipcode)
    attributes.each { |key, val| send("#{key}=", val) }
    @units = units
    @zipcode = zipcode
  end

  def average_temperature
    ((@low_temperature.to_f + @high_temperature) / 2).round(2)
  end

  def convert_units_to
    units == "F" ? "C" : "F"
  end

  def convert_temperatures(units, temps)
    if units == "F"
      temps.each { |k, v| send("#{k}=", convert_temperature_to_fahrenheit(v)) }
    else
      temps.each { |k, v| send("#{k}=", convert_temperature_to_celsius(v)) }
    end
  end

  def convert_temperature_to_fahrenheit(temp)
    ((temp.to_f * 9 / 5) + 32).round(2)
  end

  def convert_temperature_to_celsius(temp)
    ((temp.to_f - 32) * 5 / 9).round(2)
  end
end
