# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

$airports = %w[DXB HDN LAX MNL MAD SIN MIA HKG ICN]

def seed_airports
  $airports.each do |code|
    Airport.find_or_create_by!(code: code)
  end
end

def seed_flights
  20.times do
    Flight.find_or_create_by!(random_flight_data)
  end
end

def random_flight_data
  date = Faker::Time.between(from: DateTime.now, to: 1.year.from_now, format: :default)
  duration = Faker::Number.between(from: 120, to: 1100)
  departure = random_airport
  arrival = random_airport

  until departure != arrival
    arrival = random_airport
  end

  { date: date, duration: duration, departure_airport: departure, arrival_airport: arrival }
end

def random_airport
  Airport.find_by(code: $airports.sample)
end

seed_airports
seed_flights
