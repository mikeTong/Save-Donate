class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :organization_id
      t.string :title
      t.string :description
      t.datetime :close_time
      t.integer :status

      t.timestamps null: false
    end
    add_index :events, :organization_id
  end
end
