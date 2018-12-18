class AddOfertaToFolders < ActiveRecord::Migration[5.1]
  def change
    add_column :folders, :oferta, :string
  end
end
