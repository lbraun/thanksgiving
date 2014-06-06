Donation.destroy_all
CategoryRecord.destroy_all
Recipient.destroy_all

require 'csv'
path = "/Users/Luke/Downloads/Thanksgiving\ Gifts\ -\ Philanthropy.csv"
rows = []
CSV.foreach(path) do |row|
  rows << row
end

headers = rows[2].map! { |header| header.strip }
recipients_hash = {}

rows.each do |row|
  h = {}
  i = 0
  headers.each do |header|
    h[header.try(:strip)] = row[i].try(:strip)
    i += 1
  end
  recipients_hash[row.first.try(:strip)] = h
end

recipients_hash.delete "Thanksgiving Gifts"
recipients_hash.delete nil
recipients_hash.delete "Recipient"
recipients_hash.delete "Total"
recipients_hash.delete "Total Income"
recipients_hash.delete "Percent given away"

recipients_hash.each do |k,v|
  recipient = Recipient.find_by_name(k)
  if recipient.nil?
    recipient = Recipient.create!(name: k, reasons_for_support: v["Reasons for support"])
    if v["Category"]
      v["Category"].split(", ").each do |category|
        recipient.category_records.create!(category: category)
      end
    end
  end
  ["2014", "2013", "2012", "2011", "2010"].each do |year|
    next if v[year].nil?
    Donation.create!(recipient: recipient, amount: v[year].delete("$ ").to_d, date: Date.parse("#{year}-01-01"))
  end
end
