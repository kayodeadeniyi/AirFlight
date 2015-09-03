# Preview all emails at http://localhost:3000/rails/mailers/flight_mailer
class FlightMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/flight_mailer/flight_details
  def flight_details
    FlightMailer.flight_details
  end

end
