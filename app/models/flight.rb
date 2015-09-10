class Flight < ActiveRecord::Base
  validates :start_location, :presence => true
  validates :end_location, :presence => true
  validates :start_time, :presence => true
  validates :duration, :presence => true
  validates :price, :presence => true
  validate :start_location_must_be_diff_from_end_location

  belongs_to :from_airport, :foreign_key => :start_location, :class_name => "Airport"
	belongs_to :to_airport, :foreign_key => :end_location, :class_name => "Airport"
	has_many :bookings
  has_many :passengers, through: :bookings


  def start_location_must_be_diff_from_end_location
    if start_location == end_location
      errors.add(:end_location, "Start location cannot be the same as end location!")
    end
  end

  def self.format_date(date)
    date = date.to_date
    date.beginning_of_day..date.end_of_day
  end

  def self.search(from, to, date)
    where(start_location: from, end_location: to, start_time: Flight.format_date(date))
  end
end
