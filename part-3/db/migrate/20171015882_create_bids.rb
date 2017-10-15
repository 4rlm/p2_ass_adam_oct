class CreateBids < ActiveRecord::Migration[5.0]
  def change
    create_table :bids do |t|
      t.decimal :amount
			t.integer :user_id
			t.integer :item_id

      t.timestamps null: false
    end
  end
end
