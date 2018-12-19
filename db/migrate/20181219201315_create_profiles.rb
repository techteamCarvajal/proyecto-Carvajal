class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :nivel_educativo
      t.string :experiencia_laboral
      t.string :sector
      t.string :tarjeta_profesional
      t.string :num_tarjeta_profesional
      t.string :fecha_expedicion
      t.string :parentesco_carvajal
      t.string :hoja_vida
      t.string :ingles
      t.string :programas
      t.string :cursos
      t.string :certificado_curso
      t.string :habilidades

      t.timestamps
    end
  end
end
