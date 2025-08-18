class FlightsController < ApplicationController
  def index
    @departures = Flight.all.map { |f| [ f.departure_airport.code, f.departure_airport.id ] }.uniq
    @arrivals = Flight.all.map { |f| [ f.arrival_airport.code, f.arrival_airport.id ] }.uniq
    @dates = Flight.all.map { |f| [ f.date.strftime("%m-%d-%Y"), f.date.strftime("%Y-%m-%d") ] }.sort.uniq

    unless params["search"].nil?
      @flights = Flight.where("departure_airport_id = ? AND arrival_airport_id = ? AND DATE(date) = ?",
                search_params["departure_airport_id"], search_params["arrival_airport_id"], search_params["date"])
    end
  end

  private

  def search_params
    params.require(:search).permit(:departure_airport_id, :arrival_airport_id, :passenger_count, :date)
  end
end
