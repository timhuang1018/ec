class AddColumnToCartDetails < ActiveRecord::Migration[5.1]
  def change
  	add_column :cart_details, :cart_record_id, :integer
  	add_index :cart_details, :cart_record_id
  end
end
