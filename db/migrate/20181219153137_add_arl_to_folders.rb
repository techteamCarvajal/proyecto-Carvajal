class AddArlToFolders < ActiveRecord::Migration[5.1]
  def change
    add_column :folders, :arl, :string
    add_column :folders, :radicacion_eps, :string
  end
end
