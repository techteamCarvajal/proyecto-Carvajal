class AddSectorToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :sector, :string
  end
end
