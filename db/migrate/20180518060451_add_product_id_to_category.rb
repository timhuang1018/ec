class AddProductIdToCategory < ActiveRecord::Migration[5.1]
  def change
  end

    add_column :categories, :product_id, :integer
    add_index :categories, :product_id
 
end
