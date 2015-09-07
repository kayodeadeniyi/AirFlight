class FlightMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.flight_mailer.flight_details.subject
  #
  def flight_details
    @greeting = "Hi"
    # @flight_details = flight
    mail to: 'kaykayboy2000@yahoo.com', subject: "Flight Booking Details"
  end
end
