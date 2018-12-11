class DropRecognitions < ActiveRecord::Migration[5.1]
  def change
  	drop_table :recognitions
  	drop_table :texts
  end
end
