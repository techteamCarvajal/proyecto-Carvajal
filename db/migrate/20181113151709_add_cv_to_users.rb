class AddCvToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :cv, :string
  end
end
