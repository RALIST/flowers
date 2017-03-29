class AddTimeToCompany < ActiveRecord::Migration[5.0]
  def change
    change_table :companies do |t|
      t.column :opened_at, :time
      t.column :closed_at, :time
      t.string :fb_url
      t.string :vk_url
      t.string :insta_url
    end
  end
end
