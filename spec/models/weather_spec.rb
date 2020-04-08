require 'rails_helper'

RSpec.describe Weather, type: :model do
    temps = { current_temp: 80, low_temp: 70, high_temp: 85 }
    let (:weather) { Temp.new(temps) }

    describe 'Weather object' do
        it "has a current temperature" do
            expect(weather.current_temp).to eq 80
        end

        it 'has a low temp' do
            expect(weather.lo_temp).to eq 70
        end

        it 'has a high temp' do
            expect(weather.hi_temp).to eq 85
        end
    end
end