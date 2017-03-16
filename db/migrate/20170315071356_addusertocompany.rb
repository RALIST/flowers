class Addusertocompany < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :owner_id, :integer
  end
end
