class AddNameAndPhoneToCompany < ActiveRecord::Migration
  def change
    change_table :companies do |t|
      t.string :name
      t.string :phone
      t.string :authentication_token
    end
    add_index :companies, :authentication_token
  end
end
