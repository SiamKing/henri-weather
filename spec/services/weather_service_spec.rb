require "rails_helper"
require "ostruct"

RSpec.describe WeatherService, type: :service do
  let(:weather_service) { WeatherService.new }

  describe "public instance methods" do
    context "responds to its methods" do
      it { expect(weather_service).to respond_to(:get_weather_by_zipcode) }
    end

    describe ".get_weather_by_zipcode" do
      context "when valid" do
        it "responds with 200 code" do
          VCR.use_cassette("correct_result") do
            resp = weather_service.get_weather_by_zipcode("85281")
            body = JSON.parse(resp.body, object_class: OpenStruct)

            expect(resp.status).to eq 200
            expect(body.main.temp).to eq 57.15
          end
        end
      end
    end
  end
end
