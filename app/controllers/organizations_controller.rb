class OrganizationsController < Devise::RegistrationsController
  skip_before_action :authenticate_scope!

  def create 
    @organization = Organization.new(organization_params)
    if @organization.save
      render :json => {success: true, message: "Account created!", organization: {id: organization.id, email: organization.email, authentication_token: organization.authentication_token}}
    else
      warden.custom_failure!
      render :json => {success: false, message: "Something went wrong!"}, status: 422
    end
  end

  def destroy
    @organization = Organization.find_by_email(request.headers['X-Organization-Email'])
    if @organization && @organization.authentication_token == request.headers['X-Organization-Token']
      @organization.destroy
      render json: {success: true}
    else
      render json: {error: "You need to sign in or sign up before continuing."}
    end
  end
  
  def show
    @organization = Organization.find_by_email(request.headers['X-Organization-Email'])
    if @organization && @organization.authentication_token == request.headers['X-Organization-Token']
      render json: @organization
    else
      render json: {error: "You need to sign in or sign up before continuing."}
    end    
  end

  protected 

  def organization_params
  end
end
