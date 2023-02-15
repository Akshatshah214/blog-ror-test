class AddCustomAttrToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string
    add_column :users, :contract, :string
    add_column :users, :birth_date, :date
    add_column :users, :address, :string
  end
end
