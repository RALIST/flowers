class AddPriceTypeToPosition < ActiveRecord::Migration[5.0]
  def change
    change_table :positions do |t|
      t.string :price_type
    end
  end
end
