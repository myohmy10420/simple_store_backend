class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :user_name
      t.string :user_phone
      t.integer :total_price

      t.timestamps
    end
  end
end
