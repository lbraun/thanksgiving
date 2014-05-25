class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.decimal :amount
      t.integer :recipient_id
      t.date :date
      t.string :method

      t.timestamps
    end
  end
end
