# frozen_string_literal: true

class Companies::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
   end

  # POST /resource/sign_in
   def create
    self.resource = warden.authenticate!(auth_options)
    flash[:notice] = "Ha iniciado exitosamente."
    sign_in(resource_name, resource)
    yield resource if block_given?
    redirect_to  new_offer_path
   end

  # DELETE /resource/sign_out
   def destroy
     super
   end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
