class AddStatusToFolders < ActiveRecord::Migration[5.1]
def up
    add_column :folders, :status, :string
  end

  def down
    remove_column :folders, :status
  end
end
