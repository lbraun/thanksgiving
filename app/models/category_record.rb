class CategoryRecord < ActiveRecord::Base
  belongs_to :recipient

  def to_s
    category
  end
end
