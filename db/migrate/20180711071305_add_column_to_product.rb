class AddColumnToProduct < ActiveRecord::Migration[5.1]
  def change
  	add_column :products, :in_stocks, :integer
  	add_column :products, :safety_stocks, :integer
  	add_index :products, :in_stocks
  	add_index :products, :safety_stocks
  end
end
