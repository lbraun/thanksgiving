class Recipient < ActiveRecord::Base
	has_many :donations

  validates_presence_of :name

  def to_s
    name
  end

  def total_amount_received
    donations.sum(:amount)
  end
end
