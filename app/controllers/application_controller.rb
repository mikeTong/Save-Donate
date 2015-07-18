class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include ActionController::ImplicitRender
  
  respond_to :json

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u| 
      u.permit(:name, :email, :password, :password_confirmation, :phone, :description, :short_description)
    end
  end
end
