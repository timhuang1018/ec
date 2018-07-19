class AddColumnToReplenish < ActiveRecord::Migration[5.1]
  def change
  	add_column :replenish_details, :replenish_id, :integer
  	add_index :replenish_details, :replenish_id
  end
end
