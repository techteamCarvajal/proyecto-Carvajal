class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 before_action :configure_permitted_parameters, if: :devise_controller?
 protected

		def configure_permitted_parameters
			devise_parameter_sanitizer.permit(:sign_up, keys: [:celular, :nombres, :apellidos, :tipo_documento,:numero_documento])
			devise_parameter_sanitizer.permit(:account_update, keys: [:celular, :nombres, :apellidos, :tipo_documento,:numero_documento,:direccion,:city_id,:department_id,:fecha_nacimiento])
		end
end

