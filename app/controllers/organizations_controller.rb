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
  
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u| 
      u.permit(:name, :email, :password, :password_confirmation, :phone, :description, :short_description)
    end
  end
end
