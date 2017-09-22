class AddHeightAndWidthToProducts < ActiveRecord::Migration[5.0]
  def change
    change_table :products do |t|
      t.float :height
      t.float :width
    end
  end
end
