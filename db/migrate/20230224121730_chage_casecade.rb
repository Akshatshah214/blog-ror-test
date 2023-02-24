class ChageCasecade < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key "postsaves", "posts"
    add_foreign_key "postsaves", "posts", on_delete: :cascade
    remove_foreign_key "comments", "posts"
    add_foreign_key "comments", "posts", on_delete: :cascade
  end
end
