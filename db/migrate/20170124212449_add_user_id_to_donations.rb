class AddUserIdToDonations < ActiveRecord::Migration[4.2]
  def change
    add_column :donations, :user_id, :integer
  end
end
