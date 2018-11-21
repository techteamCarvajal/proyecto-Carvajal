class AddStatusToDocuments < ActiveRecord::Migration[5.1]
  def up 
    add_column :documents, :status, :string
  end

  def down
  	remove_column :products, :status
  end
end
