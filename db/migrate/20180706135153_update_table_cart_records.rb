class UpdateTableCartRecords < ActiveRecord::Migration[5.1]
  def change
  	remove_column :cart_records, :product_name
  	remove_column :cart_records, :quantity
  	add_column :cart_records, :buy_date, :string
  end
end
