class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.text :desc
      t.references :checkout
      t.timestamps
    end
  end
end
