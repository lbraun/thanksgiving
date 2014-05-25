json.array!(@donations) do |donation|
  json.extract! donation, :id, :amount, :recipient_id, :date, :method
  json.url donation_url(donation, format: :json)
end
