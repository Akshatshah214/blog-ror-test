class AddColumnToLikeColumn < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :users
  end
end
