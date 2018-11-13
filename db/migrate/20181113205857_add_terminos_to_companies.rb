class AddTerminosToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :terminos, :boolean
  end
end
