json.array!(@airports) do |airport|
  json.extract! airport, :id
  json.url airport_url(airport, format: :json)
end
