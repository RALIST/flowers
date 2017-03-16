class ChangeTypeOfGender < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :gender
    add_column :users, :gender, :integer
  end
end
