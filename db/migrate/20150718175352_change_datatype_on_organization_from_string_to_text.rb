class ChangeDatatypeOnOrganizationFromStringToText < ActiveRecord::Migration
  def change
    change_column :organizations, :description,  :text
    change_column :coupons, :description,  :text
  end
end
