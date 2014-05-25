class Recipient < ActiveRecord::Base
	has_many :donations
  has_many :category_records

  validates_presence_of :name

  def to_s
    name
  end

  def total_amount_received
    donations.sum(:amount)
  end

  def categories_string
    category_records.map(&:category).join(', ')
  end
end
