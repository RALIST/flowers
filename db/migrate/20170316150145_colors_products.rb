class ColorsProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :colors_products, id: false do |t|
      t.references :color
      t.references :product
    end
  end
end
