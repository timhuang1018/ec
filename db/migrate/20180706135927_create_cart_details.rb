class CreateCartDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :cart_details do |t|
      t.string :product_name
 	  t.integer :quantity
 	  t.integer :unit_price
      t.timestamps
    end
  end
end
