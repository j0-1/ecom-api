class CreateVariants < ActiveRecord::Migration[5.0]
  def change
    create_table :variants do |t|
      t.references :product, foreign_key: true
      t.integer :waist, null: false
      t.integer :length, null: false
      t.string :style, null: false
      t.integer :inventory_count, null: false

      t.timestamps
    end
  end
end
