class AddReasonsForSupportToRecipient < ActiveRecord::Migration
  def change
    add_column :recipients, :reasons_for_support, :text
  end
end
