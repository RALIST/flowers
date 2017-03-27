class AddFieldsToCheckout < ActiveRecord::Migration[5.0]
  def change
    change_table :checkouts do |t|
      t.references :sender
      t.references :receiver
      t.references :address
      t.string :order_date
      t.string :order_time
      t.references :card_id
      t.remove :user_id
    end
  end
end
