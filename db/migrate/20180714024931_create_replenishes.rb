class CreateReplenishes < ActiveRecord::Migration[5.1]
  def change
    create_table :replenishes do |t|
      t.string :name
      t.integer :total_weight
      t.integer :freight_fee
      t.timestamps
    end
  end
end
