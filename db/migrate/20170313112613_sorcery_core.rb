class SorceryCore < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :crypted_password
      t.string :salt
      t.string :name
      t.string :last_name
      t.string :phone
      t.string :gender
      t.timestamps
    end

    add_index :users, [:email, :phone], unique: true
  end
end
