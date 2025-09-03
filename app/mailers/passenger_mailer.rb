class PassengerMailer < ApplicationMailer
  default from: "notifications@example.com"

  def confirmation_email
    @passenger = params[:passenger]
    @flight = params[:flight]
    @url = "http://example.com/confimation"
    mail(to: @passenger.email, subject: "Flight Booking Confirmation")
  end
end
