require "rails_helper"

RSpec.describe Weather, type: :model do
  temperatures_fahrenheit = { current_temperature: 80, low_temperature: 70, high_temperature: 85 }
  temperatures_celsius = { current_temperature: 26, low_temperature: 21, high_temperature: 29 }
  let (:weather_f) { Weather.new(temperatures_fahrenheit) }
  let (:weather_c) { Weather.new(temperatures_celsius) }

  describe "Weather object" do
    it "has a current temperature" do
      expect(weather_f.current_temperature).to eq 80
    end

    it "has a low temperature" do
      expect(weather_f.high_temperature).to eq 85
    end
  end

  describe "public instance methods" do
    context "responds to its methods" do
      it { expect(weather_f).to respond_to(:convert_temperatures) }
      it { expect(weather_f).to respond_to(:average_temperature) }
    end

    describe ".average_temperature" do
      it { expect(weather_f.average_temperature).to eq 77 }
    end

    describe ".convert_temperatures" do
    end

    describe ".convert_temperature_to_fahrenheit" do
      it "converts celsius temperatures to fahrenheit" do
        expect(weather_c.convert_temperature_to_fahrenheit(weather_c.current_temperature)).to eq 80
      end
    end
  end
end
