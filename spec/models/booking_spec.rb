require 'rails_helper'

RSpec.describe Booking, type: :model do
  it 'is invalid without a flight_id' do
    booking_with_flight_id = Booking.create(flight_id: 1, user_id: 1)
    booking_without_flight_id = Booking.create(user_id: 1)

    expect(booking_with_flight_id).to be_valid
    expect(booking_without_flight_id).not_to be_valid
  end

  it 'is invalid without a user_id' do
    booking_with_user_id = Booking.create(flight_id: 1, user_id: 1)
    booking_without_user_id = Booking.create(flight_id: 1)

    expect(booking_with_user_id).to be_valid
    expect(booking_without_user_id).not_to be_valid
  end
end
