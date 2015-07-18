class AdvertisementSerializer < ActiveModel::Serializer
  attributes :id, :url, :organization_name, :company_name, :coupon_short_description,
             :coupon_description, :organization_short_description, :organization_description

  has_one :coupon
  def company_name
    object.company.name
  end

  def organization_name
    object.organization.name
  end

  def coupon_short_description
    object.coupon.short_description
  end

  def coupon_description
    object.coupon.description
  end

  def organization_short_description
    object.organization.short_description
  end

  def organization_description
    object.organization.description
  end
end
