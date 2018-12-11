class DropCities < ActiveRecord::Migration[5.1]
  	def change
    drop_table :cities
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
  
end
