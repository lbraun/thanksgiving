class AddUrlToRecipients < ActiveRecord::Migration[5.2]
  def change
    add_column :recipients, :url, :string
  end
end
