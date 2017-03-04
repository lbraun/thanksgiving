class AddUserIdToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :user_id, :integer
  end
end
