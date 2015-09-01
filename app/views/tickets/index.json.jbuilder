json.array!(@tickets) do |ticket|
  json.extract! ticket, :id
  json.url ticket_url(ticket, format: :json)
end
