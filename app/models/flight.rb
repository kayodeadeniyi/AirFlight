class Flight < ActiveRecord::Base

  belongs_to :from_airport, :foreign_key => :start_location, :class_name => "Airport"
	belongs_to :to_airport, :foreign_key => :end_location, :class_name => "Airport"
	has_many :bookings

end
