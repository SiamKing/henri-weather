class Location < ApplicationRecord
  validates :zipcode, presence: true, uniqueness: true
  validates_format_of :zipcode, with: /\A\d{5}-\d{4}|\A\d{5}\z/
end
