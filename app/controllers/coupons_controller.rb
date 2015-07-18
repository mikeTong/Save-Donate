class CouponsController < ApplicationController
  def create
    @advertisement = Advertisement.find(params[:advertisement_id])
    @coupon = Coupon.create(coupon_params)
    @coupon.advertisement_id = @advertisement.id
    if @coupon.save
      render json: {success: true}
    else
      render json: {success: false}
    end
  end

  def destroy
    @coupon = Coupon.find(params[:id])
    if @coupon.destroy
      render json: {success: true}
    else
      render json: {success: false}
    end    
  end

  private

  def coupon_params
    params.require(:coupon).permit(:title, :description, :short_description)
  end
end
