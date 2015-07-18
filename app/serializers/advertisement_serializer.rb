class AdvertisementSerializer < ActiveModel::Serializer
  attributes :id, :url, :organization_id, :company_id

  has_one :coupon
end
