class AddFechaNacimientoToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :fecha_nacimiento, :date
    add_column :users, :direccion, :string
    add_column :users, :departamento, :string
    add_column :users, :ciudad, :string
    add_column :users, :nivel_educativo, :string
    add_column :users, :pregrado, :string
    add_column :users, :experiencia_laboral, :string
    add_column :users, :referencia_laboral, :string
    add_column :users, :hoja_vida, :string
      end
end
