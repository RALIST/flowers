class AddDeliveryToCompany < ActiveRecord::Migration[5.0]
  def change
    change_table :companies do |t|
      t.float :delivery_cost
    end
  end
end
