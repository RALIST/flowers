class CreateBalloons < ActiveRecord::Migration[5.0]
  def change
    create_table :balloons do |t|
      t.float :price
      t.text :desc
      t.timestamps
    end
  end
end
