require "rails_helper"

RSpec.describe Weather, type: :model do
  temps = { current_temp: 80, low_temp: 70, high_temp: 85 }
  let (:weather) { Weather.new(temps) }

  describe "Weather object" do
    it "has a current temperature" do
      expect(weather.current_temp).to eq 80
    end

    it "has a low temp" do
      expect(weather.low_temp).to eq 70
    end

    it "has a high temp" do
      expect(weather.high_temp).to eq 85
    end
  end

  describe "public instance methods" do
    context "responds to its methods" do
      it { expect(weather).to respond_to(:convert_temps) }
      it { expect(weather).to respond_to(:average_temp) }
    end

    describe ".average_temp" do
      it { expect(weather.average_temp).to eq 77 }
    end
  end
end
