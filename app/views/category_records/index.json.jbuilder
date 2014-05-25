json.array!(@category_records) do |category_record|
  json.extract! category_record, :id, :recipient_id, :category
  json.url category_record_url(category_record, format: :json)
end
