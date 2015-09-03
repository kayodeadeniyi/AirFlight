class Flight < ActiveRecord::Base

  belongs_to :from_airport, :foreign_key => :start_location, :class_name => "Airport"
	belongs_to :to_airport, :foreign_key => :end_location, :class_name => "Airport"
	has_many :bookings
  has_many :passengers, through: :bookings



  def self.format_date(date)
    date = date.to_date
    date.beginning_of_day..date.end_of_day
  end

  def self.search(from, to, date)
    where(start_location: from, end_location: to, start_time: Flight.format_date(date))
  end
end
