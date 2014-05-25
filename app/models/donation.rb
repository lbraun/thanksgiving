class Donation < ActiveRecord::Base
  belongs_to :recipient

  validates_presence_of :amount, :recipient

  DONATION_METHODS = %w{
    credit_card
    cash
  }

  def to_s
    "$#{amount} to #{recipient.name}"
  end
end
