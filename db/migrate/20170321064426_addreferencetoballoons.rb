class Addreferencetoballoons < ActiveRecord::Migration[5.0]
  def change
    change_table :positions do |t|
      t.references :balloon, index: true, foreign_key: true
    end
  end
end
