class RegistrationsController < Devise::RegistrationsController

    def create
      build_resource(registration_params)
      resource.save
      sign_up(resource_name, resource) if resource.persisted?
  
      render_jsonapi_response(resource)
    end

    private
    def registration_params
      params.permit(:email, :password)
    end
  end