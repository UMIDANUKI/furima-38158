class CreateOrderDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :order_details do |t|
      t.string :post_code, null: false
      t.integer :prefectures_id, null: false
      t.string :municipalities,  null: false
      t.string :address, null: false
      t.string :buildings
      t.string :phone_number, null: false
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
