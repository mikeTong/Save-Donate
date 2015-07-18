class Advertisement < ActiveRecord::Base
  has_one :coupon
  belongs_to :organization
  belongs_to :company

  before_create :default_values

  private

  def default_values
    self.count ||= 0
    self.count_history ||= 0
    self.length ||= 15
  end
end
