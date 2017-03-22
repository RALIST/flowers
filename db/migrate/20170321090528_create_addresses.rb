class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :country
      t.string :city, default: 'Ижевск'
      t.string :street
      t.string :house
      t.string :flat
      t.references :user, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
