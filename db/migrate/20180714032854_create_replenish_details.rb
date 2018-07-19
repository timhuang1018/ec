class CreateReplenishDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :replenish_details do |t|
      t.string :product_name
      t.integer :amount
      t.integer :after_instock
      t.integer :unit_price
      t.integer :subtal_price
      t.integer :unit_weight
      t.integer :subtal_weight
      t.timestamps
    end
  end
end
