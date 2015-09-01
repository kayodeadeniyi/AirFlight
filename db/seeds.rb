# This file should contain all the recIFE creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ code: 'Chicago' }, { code: 'Copenhagen' }])
#   Mayor.create(code: 'Emanuel', city: cities.first)

#seed for airport
Airport.delete_all

Airport.create!([{name: "LAGOS", code: "LAG"},{name: "IBADAN", code: "IB"},{name: "ABUJA", code: "ABJ"},{name: "IFE", code: "IFE"}])
t = Time.now
hours = 60
days = 60 * 60 * 24

def randomize
  Random.new.rand(11.1..15.9)
end

#seed for flights
Flight.delete_all

30.times do
	Flight.create!([
    {start_location: Airport.find_by(code: "LAG").id, end_location: Airport.find_by(code: "IB").id, start_time: t + randomize * days,duration: 6 * hours},
		{start_location: Airport.find_by(code: "LAG").id, end_location: Airport.find_by(code: "ABJ").id, start_time: t + randomize * days, duration: 6 * hours},
		{start_location: Airport.find_by(code: "LAG").id, end_location: Airport.find_by(code: "IFE").id, start_time: t + randomize * days,duration: 5 * hours}
      ])
end
30.times do
	Flight.create!([
    {start_location: Airport.find_by(code: "IB").id,end_location: Airport.find_by(code: "LAG").id,start_time: t + randomize * days,duration: 6 * hours},
    {start_location: Airport.find_by(code: "IB").id,end_location: Airport.find_by(code: "ABJ").id,start_time: t + randomize * days,duration: 3 * hours},
    {start_location: Airport.find_by(code: "IB").id,end_location: Airport.find_by(code: "IFE").id,start_time: t + randomize * days,duration: 3 * hours}
      ])
end
30.times do
	Flight.create!([
    {start_location: Airport.find_by(code: "ABJ").id,end_location: Airport.find_by(code: "LAG").id,start_time: t + randomize * days,duration: 6 * hours},
    {start_location: Airport.find_by(code: "ABJ").id,end_location: Airport.find_by(code: "IB").id,start_time: t + randomize * days,duration: 3 * hours},
    {start_location: Airport.find_by(code: "ABJ").id,end_location: Airport.find_by(code: "IFE").id,start_time: t + randomize * days,duration: 3 * hours}
      ])
end
30.times do
	Flight.create!([
    {start_location: Airport.find_by(code: "IFE").id,end_location: Airport.find_by(code: "LAG").id,start_time: t + randomize * days,duration: 6 * hours},
    {start_location: Airport.find_by(code: "IFE").id,end_location: Airport.find_by(code: "ABJ").id,start_time: t + randomize * days,duration: 3 * hours},
    {start_location: Airport.find_by(code: "IFE").id,end_location: Airport.find_by(code: "IB").id,start_time: t + randomize * days,duration: 3 * hours}
      ])
end
