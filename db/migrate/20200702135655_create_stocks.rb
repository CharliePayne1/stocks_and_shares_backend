class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.string :company_name
      t.integer :share_price
      t.integer :daily_change
      t.integer :user_id
      t.integer :sector_id

      t.timestamps
    end
  end
end
