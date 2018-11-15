class AddSalarioToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :salario, :float
  end
end
