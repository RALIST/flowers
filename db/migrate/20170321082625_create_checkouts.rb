class CreateCheckouts < ActiveRecord::Migration[5.0]
  def change
    create_table :checkouts do |t|
      t.references :user
      t.references :cart
      t.timestamps
    end
  end
end
