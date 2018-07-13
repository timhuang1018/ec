class AddColumnToCartDetail < ActiveRecord::Migration[5.1]
  def change
  	add_column :cart_details, :product_subtal, :integer
  end
end
