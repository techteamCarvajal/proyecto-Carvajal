class AddAceptaContratoToFolders < ActiveRecord::Migration[5.1]
  def change
    add_column :folders, :acepta_contrato, :boolean
  end
end
