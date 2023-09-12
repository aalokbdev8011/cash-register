class CreateProductOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :product_offers do |t|
      t.belongs_to :product, null: false, foreign_key: true
      t.decimal :discount, precision: 5, scale: 2
      t.integer :for_quantity

      t.timestamps
    end
  end
end
