require "rails_helper"

RSpec.describe Location, type: :model do
  let(:location) { Location.new(zipcode: "85281") }

  it "is valid with valid attributes" do
    expect(location).to be_valid
  end

  it "is not valid without a zip code" do
    location_no_zip = Location.new(zipcode: nil)
    expect(location_no_zip).to_not be_valid
  end

  it "is not valid if zipcode is not unique" do
    location.save!
    duplicate_location = Location.new(zipcode: "85281")
    expect(duplicate_location).to_not be_valid
  end

  it "is not valid with invalid zip code" do
    invalid_location = Location.new(zipcode: "853")
    expect(invalid_location).to_not be_valid
  end
end
