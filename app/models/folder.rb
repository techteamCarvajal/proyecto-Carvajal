class Folder < ApplicationRecord
 
  		   belongs_to :user, optional: :true  
  		   mount_uploader :referencia_laboral, AttachmentUploader
  		   mount_uploader :soporte_estudios, AttachmentUploader
  		   mount_uploader  :fotocopia_cedula, AttachmentUploader
  		   mount_uploader :certificado_formacion, AttachmentUploader
		 
		
end
