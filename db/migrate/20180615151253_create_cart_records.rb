class CreateCartRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :cart_records do |t|
      t.integer :user_id
      t.string :user_name
      t.string :product_name
      t.integer :quantity
      t.integer :total_price
      t.timestamps
    end
  end
end
