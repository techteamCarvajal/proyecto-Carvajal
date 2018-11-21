class Folder < ApplicationRecord
 
  		 belongs_to :user, optional: :true  
		 validates :soporte_estudios,   :presence => true
		 validates :referencia_laboral, :presence => true
		 validates :fotocopia_cedula,   :presence => true
		 validates :certificado_formacion, :presence => true
		 validates :certificado_cuenta_bancaria, :presence => true
		 validates :fondo_pension,     :presence => true
		 validates :cesantias,         :presence => true
		 validates :certificado_eps, :presence => true	
end
