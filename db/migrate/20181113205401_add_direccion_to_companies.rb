class AddDireccionToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :direccion, :string
  end
end
