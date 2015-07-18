class OrganizationSessionsController <  Devise::SessionsController
  def create
    @organization = Organization.find_by_email(params[:organization][:email])
    if !@organization
      warden.custom_failure!
      render json: {error: "The email is already taken."} 
    elsif @organization.valid_password?(params[:organization][:password])
      render :json => {success: true, organization: {email:@organization.email, authentication_token: @organization.authentication_token}}, status: :created
    else
      warden.custom_failure!
      render json: {error: "Invalid email or password."}
    end
  end  
end