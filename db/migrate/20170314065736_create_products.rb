class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :desc
      t.float :price
      t.integer :order_count
      t.integer :views_count
      t.references :company
      t.timestamps
    end
  end
end
