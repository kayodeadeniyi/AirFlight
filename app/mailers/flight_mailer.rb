class FlightMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.flight_mailer.flight_details.subject
  #
  def flight_details(user, flight)
    @greeting = "Hi #{user.first_name}"
    @flight_details = flight
    mail to: user.email, subject: "Flight Booking Details"
  end
end
