class AddStatusToDonations < ActiveRecord::Migration[4.2]
  def change
    add_column :donations, :status, :string
  end
end
