class Passenger < ApplicationRecord
  has_many :bookings

  validates :email, uniqueness: true
end
