class BookingsController < ApplicationController
  def new
    @flight = Flight.find(booking_params["flight_id"])
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, :passenger_count)
  end
end
