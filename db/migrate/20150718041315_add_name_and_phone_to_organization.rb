class AddNameAndPhoneToOrganization < ActiveRecord::Migration
  def change
    change_table :organizations do |t|
      t.string :name
      t.string :phone
      t.string :authentication_token
    end
    add_index :organizations, :authentication_token
  end
end
