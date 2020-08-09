class Donation < ApplicationRecord
  belongs_to :recipient
  belongs_to :user

  validates_presence_of :amount, :recipient, :date, :status, :user
  validates :amount, numericality: true

  VALID_METHODS = %w{
    credit_card
    cash
    payment_app
    other
  }

  VALID_STATUSES = %w{
    planned
    completed
    acknowledged
  }

  def to_s
    "$#{amount} to #{recipient.name}"
  end

  def self.method_select_options
    VALID_METHODS.map { |method| [method.humanize, method] }
  end

  def self.status_select_options
    VALID_STATUSES.map { |status| [status.humanize, status] }
  end

  def completed?
    %w(completed acknowledged).include? status
  end

  def year
    date.year
  end
end
