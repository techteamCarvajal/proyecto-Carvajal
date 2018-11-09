class AddCarreraToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :carrera, :string
    add_column :users, :celular_referencia, :string
  end
end
