json.extract! offer, :id, :tipo, :nombre_cargo, :tipo_contrato, :salario_float, :objetivo, :educacion_minima, :experiencia, :idiomas, :programas, :conocimientos_especificos, :disponibilidad_viajar, :disponibilidad_residencia, :vacantes, :company_id, :created_at, :updated_at
json.url offer_url(offer, format: :json)
