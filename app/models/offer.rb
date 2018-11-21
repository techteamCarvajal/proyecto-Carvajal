class Offer < ApplicationRecord
   
   belongs_to :company
   validates :tipo, presence: true
   validates :nombre_cargo, presence: true
   validates :tipo_contrato, presence: true
   validates :salario_float, presence: true
   validates :objetivo, presence: true
   validates :educacion_minima, presence: true
   validates :experiencia, presence: true
   validates :idiomas, presence: true
   validates :programas, presence: true
   validates :conocimientos_especificos, presence: true
   validates :disponibilidad_viajar, presence: true
   validates :disponibilidad_residencia, presence: true
   validates :vacantes, presence: true

end
