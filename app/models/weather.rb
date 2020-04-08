class Weather
  include ActiveModel::Model
  attr_accessor :current_temp, :low_temp, :high_temp

  def average_temp
    ((@low_temp + @high_temp) / 2)
  end

  def convert_temps
  end
end
