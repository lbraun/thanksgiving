json.array!(@recipients) do |recipient|
  json.extract! recipient, :id, :name
  json.url recipient_url(recipient, format: :json)
end
