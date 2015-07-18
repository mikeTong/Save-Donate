class DonationsController < ApplicationController
  def create
  	@advertisement = Advertisement.find(params[:advertisement_id])
  	@organization = advertisement.organization_id
  	@amout = @advertisement.count * 0.1
  	@donation = Donation.new(advertisement_id: @advertisement.id, company_id: current_company.id, amout: @amout)
    if @advertisement.save
      render json: {success: true}
    else
      render json: {sucess: false}
    end
  end

  def get_amount
  	render json: {"donation" {"amount": "@amount"}}
  end

end
