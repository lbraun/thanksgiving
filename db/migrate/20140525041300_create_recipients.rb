class CreateRecipients < ActiveRecord::Migration[4.2]
  def change
    create_table :recipients do |t|
      t.string :name

      t.timestamps
    end
  end
end
