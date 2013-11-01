class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :group_id
      t.string :product_id
      t.string :movieTile
      t.string :store
      t.string :category
      t.string :sub_category
      t.integer :price
      t.integer :shipping_duration

      t.timestamps
    end
  end
end
