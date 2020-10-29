class Recipient < ApplicationRecord
	has_many :donations
  has_many :category_records

  validates :name, presence: true, uniqueness: true

  def to_s
    name
  end

  def total_donations(options = {})
    if options[:year]
      sql = "'#{options[:year]}-01-01' <= date AND date <= '#{options[:year]}-12-31'"
      donations.where(sql).sum(:amount)
    else
      donations.sum(:amount)
    end
  end

  def categories_string
    category_records.map { |cr| colorize_category(cr.category) }.join(' ').html_safe
  end

  def destroyable?
    donations.empty?
  end

  def self.serialized_for_api
    all.map do |recipient|
      {
        id: recipient.id,
        name: recipient.name,
      }
    end
  end
end


