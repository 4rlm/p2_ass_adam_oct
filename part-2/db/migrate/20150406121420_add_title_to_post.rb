class AddTitleToPost < ActiveRecord::Migration
  def change
    add_column :posts, :guest_name, :string, null: false
  end
end
