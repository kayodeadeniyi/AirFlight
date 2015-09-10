class Passenger < ActiveRecord::Base
	validates :name, :presence => true
  validates :email, :presence => true

	belongs_to :booking
	has_one :flight, through: :booking
end
