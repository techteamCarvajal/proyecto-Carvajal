class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
      t.string :soporte_estudios
      t.string :referencia_laboral
      t.string :fotocopia_cedula
      t.string :certificado_formacion
      t.string :certificado_cuenta_bancaria
      t.string :fondo_pension
      t.string :afiliacion_cesantias

      t.timestamps
    end
  end
end
