class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.integer :company_id
      t.integer :organization_id
      t.integer :amount

      t.timestamps null: false
    end
    add_index :donations, :company_id
    add_index :donations, :organization_id
  end
end
