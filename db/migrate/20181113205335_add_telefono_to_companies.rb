class AddTelefonoToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :telefono, :string
  end
end
