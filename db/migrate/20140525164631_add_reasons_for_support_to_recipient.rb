class AddReasonsForSupportToRecipient < ActiveRecord::Migration[4.2]
  def change
    add_column :recipients, :reasons_for_support, :text
  end
end
