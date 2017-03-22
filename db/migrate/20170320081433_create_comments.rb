class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :title
      t.text :desc
      t.references :commentable, polymorphic: true
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
