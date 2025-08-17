class FlightsController < ApplicationController
  def index
    @flight = Flight.new
    @departures = Flight.all.map { |f| [ f.departure_airport.code, f.departure_airport.id ] }.uniq
    @arrivals = Flight.all.map { |f| [ f.arrival_airport.code, f.arrival_airport.id ] }.uniq
    @dates = Flight.all.map { |f| [ f.date.strftime("%m/%d/%Y") ] }
  end

  def show
  end
end
