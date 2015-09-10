require 'rails_helper'

RSpec.describe Flight, type: :model do

  before(:all) do
    @hours = 60
    @days = 60 * 60 * 24
    @start_location = 1
    @end_location = 2
    @start_time = Time.now
    @duration = 6 * @hours
    @price = 6 * @hours * 5
  end

  it 'is invalid without a @start_location' do
    flight_1 = Flight.create(start_location: @start_location, end_location: @end_location, start_time: @start_time, duration: @duration, price: @price)
    flight_2 = Flight.create(end_location: @end_location, start_time: @start_time, duration: @duration, price: @price)

    expect(flight_1).to be_valid
    expect(flight_2).not_to be_valid
  end

  it 'is invalid without an @end_location' do
    flight_1 = Flight.create(start_location: @start_location, end_location: @end_location, start_time: @start_time, duration: @duration, price: @price)
    flight_2 = Flight.create(start_location: @start_location, start_time: @start_time, duration: @duration, price: @price)

    expect(flight_1).to be_valid
    expect(flight_2).not_to be_valid
  end

  it 'is invalid without a @start_time' do
    flight_1 = Flight.create(start_location: @start_location, end_location: @end_location, start_time: @start_time, duration: @duration, price: @price)
    flight_2 = Flight.create(start_location: @start_location, end_location: @end_location, duration: @duration, price: @price)

    expect(flight_1).to be_valid
    expect(flight_2).not_to be_valid
  end

  it 'is invalid without a @duration' do
    flight_1 = Flight.create(start_location: @start_location, end_location: @end_location, start_time: @start_time, duration: @duration, price: @price)
    flight_2 = Flight.create(start_location: @start_location, end_location: @end_location, start_time: @start_time, price: @price)

    expect(flight_1).to be_valid
    expect(flight_2).not_to be_valid
  end

  it 'is invalid without a @price' do
    flight_1 = Flight.create(start_location: @start_location, end_location: @end_location, start_time: @start_time, duration: @duration, price: @price)
    flight_2 = Flight.create(start_location: @start_location, end_location: @end_location, start_time: @start_time, duration: @duration)

    expect(flight_1).to be_valid
    expect(flight_2).not_to be_valid
  end

  it 'is invalid if @start_location equals @end_location' do
    flight_1 = Flight.create(start_location: @start_location, end_location: @end_location, start_time: @start_time, duration: @duration, price: @price)
    flight_2 = Flight.create(start_location: @start_location, end_location: @start_location, start_time: @start_time, duration: @duration, price: @price)
    flight_3 = Flight.create(start_location: @end_location, end_location: @end_location, start_time: @start_time, duration: @duration, price: @price)

    expect(flight_1).to be_valid
    expect(flight_2).not_to be_valid
    expect(flight_3).not_to be_valid
  end

end
