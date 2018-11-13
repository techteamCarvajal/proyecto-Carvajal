class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_notifications

  protected

		def configure_permitted_parameters
			devise_parameter_sanitizer.permit(:sign_up, keys: [:celular, :nombres, :apellidos, :tipo_documento,:numero_documento])
			devise_parameter_sanitizer.permit(:account_update, keys: [:celular, :nombres, :apellidos, :tipo_documento,:numero_documento,:direccion,:nivel_educativo,:pregrado,:ciudad,:departamento])
		end

		def get_notifications
			@notifications = []

			if user_signed_in?
				bad_r = 0
				good_r = 0
				current_user.recordings.each do |recording|
					if recording.status == 0
						bad_r = bad_r + 1
					else
						good_r = good_r + 1
					end
				end

				if bad_r < good_r
					@notifications << {text: "Tu caso de violencia es grave por tus grabaciones"}.as_json
				end

				bad_i = 0
				good_i = 0

				current_user.texts.each do |text|
					if text.status == 0
						bad_i = bad_i + 1
					else
						good_i = good_i + 1
					end
				end

				if bad_i < good_i
					@notifications << {text: "Tu caso de violencia es grave por tus conversaciones"}.as_json
				end

			end
		end
end
