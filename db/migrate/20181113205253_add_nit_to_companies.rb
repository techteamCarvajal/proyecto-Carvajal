class AddNitToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :nit, :string
  end
end
