class AddCedulaToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :cedula, :string
    add_column :users, :celular, :string
    add_column :users, :nombres, :string
    add_column :users, :apellidos, :string
    add_column :users, :situacion_sentimental, :string
  end
end
