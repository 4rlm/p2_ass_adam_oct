class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text   :body, null: false
      t.string :hometown

      t.timestamps
    end
  end
end
