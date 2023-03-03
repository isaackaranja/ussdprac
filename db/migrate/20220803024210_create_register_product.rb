class CreateRegisterProduct < ActiveRecord::Migration[5.2]
  def change
    create_table :register_products do |t|
      t.string  :name
      t.string  :unit
      t.string  :price_per_unit
      t.integer :quantity
    end
  end
end
