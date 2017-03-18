class CreatePositions < ActiveRecord::Migration[5.0]
  def change
    create_table :positions do |t|
      t.references :cart
      t.references :product
      t.timestamps
    end
  end
end
