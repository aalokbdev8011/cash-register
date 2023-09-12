class CreateCartsProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts_products do |t|
      t.belongs_to :product, null: false, foreign_key: true
      t.belongs_to :cart, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
