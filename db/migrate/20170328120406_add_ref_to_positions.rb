class AddRefToPositions < ActiveRecord::Migration[5.0]
  def change
    change_table :positions do |t|
      t.references :order
    end

    change_table :checkouts do |t|
      t.boolean :call_receiver
      t.boolean :dont_call
    end
  end
end
