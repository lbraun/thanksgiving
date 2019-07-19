class CreateCategoryRecords < ActiveRecord::Migration[4.2]
  def change
    create_table :category_records do |t|
      t.integer :recipient_id
      t.string :category

      t.timestamps
    end
  end
end
