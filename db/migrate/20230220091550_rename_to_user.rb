class RenameToUser < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :contract, :contact
  end
end
