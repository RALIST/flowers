class Jointables < ActiveRecord::Migration[5.0]
  def change
    create_table :products_types, id: false do |t|
      t.references :type
      t.references :product
    end
    create_table :occasions_products, id: false do |t|
      t.references :occasion
      t.references :product
    end
  end
end
