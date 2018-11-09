class AddNumeroDocumentoToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :numero_documento, :string
  end
end
