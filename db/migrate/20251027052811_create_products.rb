class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :product_name, null: false
      t.text :description, null: false
      t.integer :category_id, null: false
      t.integer :product_status_id, null: false
      t.integer :delivery_cost_id, null: false
      t.integer :prefecture_id, null: false      
      t.integer :delivery_time_id, null: false
      t.integer :product_price, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
