class CreateAdvertisements < ActiveRecord::Migration
  def change
    create_table :advertisements do |t|
      t.integer :company_id
      t.integer :organization_id
      t.string :url
      t.integer :length
      t.integer :count
      t.integer :count_history

      t.timestamps null: false
    end
    add_index :advertisements, :company_id
    add_index :advertisements, :organization_id
  end
end
