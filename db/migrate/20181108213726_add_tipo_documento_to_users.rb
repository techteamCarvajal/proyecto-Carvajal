class AddTipoDocumentoToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :tipo_documento, :string
   
  end
end
