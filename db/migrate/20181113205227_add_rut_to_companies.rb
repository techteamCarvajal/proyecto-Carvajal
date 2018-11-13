class AddRutToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :rut, :string
  end
end
