class AddFieldToCheckout < ActiveRecord::Migration[5.0]
  def change
    change_table :checkouts do |t|
      t.string :delivery
      t.remove :card_id_id
      t.references :card
    end
  end
end
