class CreateFolders < ActiveRecord::Migration[5.1]
  def change
    create_table :folders do |t|
      t.string :soporte_estudios
      t.string :referencia_laboral
      t.string :fotocopia_cedula
      t.string :certificado_formacion
      t.string :certificado_cuenta_bancaria
      t.string :fondo_pension
      t.string :cesantias
      t.string :certificado_eps
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
