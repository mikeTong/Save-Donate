class CompanySessionsController <  Devise::SessionsController
  def create
    @company = Company.find_by_email(params[:company][:email])
    if !@company
      warden.custom_failure!
      render json: {error: "Invalid email or password."} 
    elsif @company.valid_password?(params[:company][:password])
      render :json => {success: true, company: {id: @company.id, email:@company.email, authentication_token: @company.authentication_token}}, status: :created
    else
      warden.custom_failure!
      render json: {error: "Invalid email or password."}
    end
  end  
end