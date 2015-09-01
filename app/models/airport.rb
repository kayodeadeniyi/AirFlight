class Airport < ActiveRecord::Base
  # has_many :departures, :foreign_key => :from_airport_id, :class_name => "Flight"
	# has_many :arrivals, :foreign_key => :to_airport_id, :class_name => "Flight"
end
