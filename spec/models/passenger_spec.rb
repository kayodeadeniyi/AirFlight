require 'rails_helper'

RSpec.describe Passenger, type: :model do
  it 'is invalid without a name' do
    name = "Kayode"
    email = "kay@yahoo.com"

    passenger_1 = Passenger.create(name: name , email: email, booking_id: 1)
    passenger_2 = Passenger.create(email: email, booking_id: 1)

    expect(passenger_1).to be_valid
    expect(passenger_2).not_to be_valid
  end

  it 'is invalid without an email' do
    name = "Kayode"
    email = "kay@yahoo.com"

    passenger_1 = Passenger.create(name: name , email: email, booking_id: 1)
    passenger_2 = Passenger.create(name: name, booking_id: 1)

    expect(passenger_1).to be_valid
    expect(passenger_2).not_to be_valid
  end

  it 'belongs to a booking' do
    name = "Kayode"
    email = "kay@yahoo.com"

    booking = Booking.create(flight_id: 1, user_id: 1)
    passenger = Passenger.create(name: name , email: email, booking_id: booking.id)
    bookings_passenger_name = booking.passengers.first.name

    expect(bookings_passenger_name).to eq(name)
  end

  # it 'belongs to a booking2' do
  #   name = "Kayode"
  #   email = "kay@yahoo.com"
  #
  #   booking = Booking.create(flight_id: 1, user_id: 1)
  #   passenger_1 = Passenger.create(name: name , email: email, booking_id: booking.id)
  #   bookings = passenger.boo
  #
  #   expect(bookings).to eq(1)
  # end
end
