class Folder < ApplicationRecord
	belongs_to :user
	mount_uploader :referencia_laboral,AttachmentUploader
    mount_uploader :soporte_estudios,AttachmentUploader
    mount_uploader :certificado_formacion, AttachmentUploader
	mount_uploader :fotocopia_cedula,AttachmentUploader	
	mount_uploader :referencia_laboral,AttachmentUploader
    mount_uploader :formato_domiciliaria,AttachmentUploader
    mount_uploader :formato_complemento, AttachmentUploader
	mount_uploader :conflicto_intereses,AttachmentUploader	
	mount_uploader :certificado_cuenta_bancaria,AttachmentUploader
    mount_uploader :fondo_pension,AttachmentUploader
    mount_uploader :cesantias,AttachmentUploader
	mount_uploader :certificado_eps,AttachmentUploader
	cattr_accessor :form_steps do
  	%w(etapa1 etapa2 etapa3 etapa4)
  end

  attr_accessor :form_step
  	validates :referencia_laboral,:soporte_estudios,:referencia_laboral,:certificado_formacion, presence: true, if: -> { required_for_step?(:etapa1) }
  	validates :formato_domiciliaria, :formato_complemento,:conflicto_intereses, presence: true, if: -> { required_for_step?(:etapa2) }
  	validates :certificado_cuenta_bancaria,:fondo_pension, :cesantias,:certificado_eps, presence: true, if: -> { required_for_step?(:etapa3) }
  
		def required_for_step?(step)
	  # All fields are required if no form step is present
	  return true if form_step.nil?
	  return true if self.form_steps.index(step.to_s) <= self.form_steps.index(form_step)
	end
		
end
