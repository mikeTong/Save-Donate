class Advertisement < ActiveRecord::Base
  has_one :coupon
  belongs_to :organization
end
