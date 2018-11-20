class Document < ApplicationRecord

	mount_uploader :soporte_estudios, AttachmentUploader 
	mount_uploader :referencia_laboral, AttachmentUploader 
	mount_uploader :fotocopia_cedula, AttachmentUploader 
	mount_uploader :certificado_formacion, AttachmentUploader 
	mount_uploader :certificado_cuenta_bancaria, AttachmentUploader 
	mount_uploader :fondo_pension, AttachmentUploader 
	mount_uploader :afiliacion_cesantias, AttachmentUploader 
	
end
