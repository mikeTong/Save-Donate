class AddDescriptionToOrganizations < ActiveRecord::Migration
  def change
    change_table :organizations do |t|
      t.string :description
      t.string :short_description
    end
  end
end
