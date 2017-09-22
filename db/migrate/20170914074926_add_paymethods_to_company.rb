class AddPaymethodsToCompany < ActiveRecord::Migration[5.0]
  def change
    change_table :companies do |t|
      t.string :paymethods, array: true
    end
  end
end
