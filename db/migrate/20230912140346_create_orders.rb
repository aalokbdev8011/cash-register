class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.decimal :total_amount, precision: 5, scale: 2

      t.timestamps
    end
  end
end
