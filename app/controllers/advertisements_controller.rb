class AdvertisementsController < ApplicationController

  def index
    @advertisements = Advertisement.all
    render json: @advertisements
  end

  def create
    @advertisement = current_company.advertisements.build(advertisement_params)
    if @advertisement.save
      render json: {success: true}
    else
      render json: {sucess: false}
    end
  end

  def destroy
    @advertisement = Advertisement.find(params[:id])
    if @advertisement.destroy
      render json: {success: true}
    else
      render json: {sucess: false}
    end    
  end

  def show
    @advertisement = Advertisement.find(params[:id])

    render json: @advertisement
  end

  def view_ad
    @advertisement = Advertisement.find(params[:id])
    @advertisement.update(count: @advertisement.count.to_i + 1)
  end

  def generate_code
    @advertisement = Advertisement.find(params[:id])
    @coupon = @advertisement.coupon
    @promo_code = SecureRandom.hex(8)
    render json: {promo_code: @promo_code, coupon: @coupon}
  end

  private

  def advertisement_params
    params.require(:advertisement).permit(:name, :url)
  end
end
