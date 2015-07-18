class OrganizationSessionsController <  Devise::SessionsController
  def create
    @organization = Organization.find_by_email(params[:organization][:email])
    if !@organization
      warden.custom_failure!
      render json: {error: "Invalid email or password."} 
    elsif @organization.valid_password?(params[:organization][:password])
      render :json => {success: true, organization: {id: @organization.id, email:@organization.email, authentication_token: @organization.authentication_token}}, status: :created
    else
      warden.custom_failure!
      render json: {error: "Invalid email or password."}
    end
  end  
end