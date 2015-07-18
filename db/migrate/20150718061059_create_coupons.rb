class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.integer :advertisement_id
      t.string :title
      t.string :description
      t.string :short_description

      t.timestamps null: false
    end
    add_index :coupons, :advertisement_id
  end
end
