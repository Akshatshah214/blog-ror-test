class AddToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :published, :boolean, default: false
  end
end
