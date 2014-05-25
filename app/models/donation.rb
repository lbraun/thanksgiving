class Donation < ActiveRecord::Base
  belongs_to :recipient

  validates_presence_of :amount, :recipient

  VALID_METHODS = %w{
    credit_card
    cash
    other
  }

  def to_s
    "$#{amount} to #{recipient.name}"
  end

  def self.method_select_options
    VALID_METHODS.map { |method| [method.humanize, method] }
  end
end
