class AddPricesToProducts < ActiveRecord::Migration[5.0]
  def change
    change_table :products do |t|
      t.float :premium_price
      t.text :premium_desc
      t.float :lux_price
      t.text :lux_desc
    end
  end
end
