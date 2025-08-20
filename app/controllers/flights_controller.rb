class FlightsController < ApplicationController
  def index
    @departures = Flight.all.map { |f| [ f.departure_airport.code, f.departure_airport.id ] }.uniq
    @arrivals = Flight.all.map { |f| [ f.arrival_airport.code, f.arrival_airport.id ] }.uniq
    @dates = Flight.all.map { |f| [ f.date.strftime("%m-%d-%Y"), f.date.strftime("%Y-%m-%d") ] }.sort.uniq

    unless params["search"].nil?
      search_flights
      @flights = @flights.map { |f| [ to_string(f), f.id ] }
      @passenger_count = search_params["passenger_count"]
    end
  end

  private

  def to_string(flight)
    "Departure Airport: #{flight.departure_airport.code}
    Arrival Airport: #{flight.arrival_airport.code}
    Date: #{flight.date.strftime("%m-%d-%Y")}
    Time: #{flight.date.strftime("%H-%M")}"
  end

  def search_params
    params.require(:search).permit(:departure_airport_id, :arrival_airport_id, :passenger_count, :date)
  end

  def search_flights
    @flights = Flight.all

    if search_params["departure_airport_id"].present?
      @flights = @flights.where("departure_airport_id = ?", search_params["departure_airport_id"])
    end

    if search_params["arrival_airport_id"].present?
      @flights = @flights.where("arrival_airport_id = ?", search_params["arrival_airport_id"])
    end

    if search_params["date"].present?
      @flights = @flights.where("DATE(date) = ?", search_params["date"])
    end
  end
end
