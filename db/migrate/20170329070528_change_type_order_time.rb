class ChangeTypeOrderTime < ActiveRecord::Migration[5.0]
  def change
    change_table :checkouts do |t|
      t.remove :order_time
      t.time :order_time
    end
  end
end
