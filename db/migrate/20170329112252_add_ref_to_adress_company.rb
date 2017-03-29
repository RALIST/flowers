class AddRefToAdressCompany < ActiveRecord::Migration[5.0]
  def change
    change_table :addresses do |t|
      t.references :company
    end
  end
end
