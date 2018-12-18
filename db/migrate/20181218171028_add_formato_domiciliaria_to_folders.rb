class AddFormatoDomiciliariaToFolders < ActiveRecord::Migration[5.1]
  def change
    add_column :folders, :formato_domiciliaria, :string
    add_column :folders, :formato_complemento, :string
    add_column :folders, :conflicto_intereses, :string
  end
end
