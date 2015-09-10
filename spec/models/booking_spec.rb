require 'rails_helper'

RSpec.describe Booking, type: :model do
  it 'is valid with a flight_id' do
    booking_1 = Booking.create(flight_id: 1, user_id: 1)
    booking_2 = Booking.create(flight_id: 1)

    expect(booking_1).to be_valid
    expect(booking_2).not_to be_valid
  end
end
