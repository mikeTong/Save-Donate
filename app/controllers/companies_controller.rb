class CompaniesController < Devise::RegistrationsController
  skip_before_action :authenticate_scope!

  def create 
    @coampany = Coampany.new(coampany_params)
    if @coampany.save
      render :json => {success: true, message: "Account created!", coampany: {id: coampany.id, email: coampany.email, authentication_token: coampany.authentication_token}}
    else
      warden.custom_failure!
      render :json => {success: false, message: "Something went wrong!"}, status: 422
    end
  end

  def destroy
    @company = Company.find_by_email(request.headers['X-Company-Email'])
    if @company && @company.authentication_token == request.headers['X-Company-Token']
      @company.destroy
      render json: {success: true}
    else
      render json: {error: "You need to sign in or sign up before continuing."}
    end
  end
  
  protected
  def coampany_params
    params.require(:coampany).permit(:email, :password, :name, :phone, :description, :short_description)
  end
end