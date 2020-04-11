require "rails_helper"

RSpec.describe Weather, type: :model do
  temperatures_fahrenheit = { current_temperature: 78.8, low_temperature: 69.8, high_temperature: 84.2 }
  temperatures_celsius = { current_temperature: 26, low_temperature: 21, high_temperature: 29 }
  let (:weather_f) { Weather.new(temperatures_fahrenheit) }
  let (:weather_c) { Weather.new(temperatures_celsius, "C") }

  describe "Weather object" do
    it "has a current temperature" do
      expect(weather_f.current_temperature).to eq 78.8
    end

    it "has a low temperature" do
      expect(weather_f.low_temperature).to eq 69.8
    end

    it "has a high temperature" do
      expect(weather_f.high_temperature).to eq 84.2
    end

    it "has a units attribute" do
      expect(weather_f.units).to eq "F"
    end
  end

  describe "public instance methods" do
    context "responds to its methods" do
      it { expect(weather_f).to respond_to(:convert_temperatures) }
      it { expect(weather_f).to respond_to(:average_temperature) }
    end

    describe ".average_temperature" do
      it "returns average of high and low fahrenheit temperatures" do
        expect(weather_f.average_temperature).to eq 77.0
      end

      it "returns average of high and low celsius temperatures" do
        expect(weather_c.average_temperature).to eq 25.0
      end
    end

    describe ".convert_temperatures" do
      it "takes multiple celsius temperatures and updates weather attributes to fahrenheit" do
        weather_c.convert_temperatures("F", temperatures_celsius)

        expect(weather_c.current_temperature).to eq 78.8
        expect(weather_c.low_temperature).to eq 69.8
        expect(weather_c.high_temperature).to eq 84.2
        expect(weather_c.average_temperature).to eq 77.0
      end

      it "takes multiple fahrenheit temperatures and updates weather attributes to celsius" do
        weather_f.convert_temperatures("C", temperatures_fahrenheit)

        expect(weather_c.current_temperature).to eq 26.0
        expect(weather_c.low_temperature).to eq 21.0
        expect(weather_c.high_temperature).to eq 29.0
        expect(weather_c.average_temperature).to eq 25.0
      end
    end

    describe ".convert_temperature_to_fahrenheit" do
      it "converts celsius temperatures to fahrenheit" do
        current_temp_in_f = weather_c.convert_temperature_to_fahrenheit(weather_c.current_temperature)
        expect(current_temp_in_f).to eq 78.8
      end
    end

    describe ".convert_temperature_to_celsius" do
      it "converts fahrenheit to celcius" do
        current_temp_in_c = weather_f.convert_temperature_to_celsius(weather_f.current_temperature)
        expect(current_temp_in_c).to eq 26.0
      end
    end
  end
end
