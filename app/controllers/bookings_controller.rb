class BookingsController < ApplicationController
  def new
    @flight = Flight.find(new_booking_params["flight_id"])
    @booking = Booking.new(flight_id: @flight.id)
    new_booking_params["passenger_count"].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      flash[:notice] = "You have successfully booked a flight"
      redirect_to @booking
    else
      @flight = Flight.find(booking_params["flight_id"])
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = Flight.find(@booking.flight.id)
    @passengers = @booking.passengers
  end

  private

  def new_booking_params
    params.require(:booking).permit(:flight_id, :passenger_count)
  end

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [ :name, :email ])
  end
end
