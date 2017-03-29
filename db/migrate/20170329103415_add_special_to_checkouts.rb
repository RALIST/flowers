class AddSpecialToCheckouts < ActiveRecord::Migration[5.0]
  def change
    add_column :checkouts, :special, :text
  end
end
