class AddNombreRepresentanteToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :nombre_representante, :string
  end
end
