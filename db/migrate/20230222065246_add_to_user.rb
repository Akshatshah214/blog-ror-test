class AddToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :admin, :boolean
    add_column :users, :editor, :boolean
  end
end
