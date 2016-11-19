class CategoryRecord < ActiveRecord::Base
  belongs_to :recipient

  validates_presence_of :category

  def to_s
    category
  end
end
