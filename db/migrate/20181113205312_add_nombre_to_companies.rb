class AddNombreToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :nombre, :string
  end
end
