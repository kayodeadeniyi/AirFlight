json.array!(@passengers) do |passenger|
  json.extract! passenger, :id
  json.url passenger_url(passenger, format: :json)
end
