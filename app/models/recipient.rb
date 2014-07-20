class Recipient < ActiveRecord::Base
	has_many :donations
  has_many :category_records

  validates_presence_of :name

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
end
