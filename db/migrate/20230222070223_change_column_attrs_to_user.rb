class ChangeColumnAttrsToUser < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :admin, :boolean, default: false
    change_column :users, :editor, :boolean, default: false
  end
end
