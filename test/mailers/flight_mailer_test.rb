require 'test_helper'

class FlightMailerTest < ActionMailer::TestCase
  test "flight_details" do
    mail = FlightMailer.flight_details
    assert_equal "Flight details", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
