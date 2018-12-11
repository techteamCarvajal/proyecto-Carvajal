class Folder < ApplicationRecord
	belongs_to :user, optional: :true 
	cattr_accessor :form_steps do
  	%w(etapa1 etapa2 etapa3)
  end

  attr_accessor :form_step

  	validates :referencia_laboral, :soporte_estudios, presence: true, if: -> { required_for_step?(:etapa1) }
    validates :fotocopia_cedula, :certificado_formacion, presence: true, if: -> { required_for_step?(:etapa2) }
 	
		def required_for_step?(step)
	  # All fields are required if no form step is present
	  return true if form_step.nil?
	  return true if self.form_steps.index(step.to_s) <= self.form_steps.index(form_step)
	end
		
end
