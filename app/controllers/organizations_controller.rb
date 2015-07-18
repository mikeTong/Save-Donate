class OrganizationsController < Devise::RegistrationsController
  skip_before_action :authenticate_scope!

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

end
