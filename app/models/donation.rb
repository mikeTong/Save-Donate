class Donation < ActiveRecord::Base
  belongs_to :company
  belongs_to :organization
end
