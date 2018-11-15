class CreateOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|
      t.boolean :tipo
      t.string :nombre_cargo
      t.string :tipo_contrato
      t.string :salario_float
      t.string :objetivo
      t.string :educacion_minima
      t.integer :experiencia
      t.string :idiomas
      t.string :programas
      t.string :conocimientos_especificos
      t.boolean :disponibilidad_viajar
      t.string :disponibilidad_residencia
      t.integer :vacantes
      t.references :company, foreign_key: true
      t.timestamps
    end
  end
end
