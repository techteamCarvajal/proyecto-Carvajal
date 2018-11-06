class ModifyTextsColumns < ActiveRecord::Migration[5.1]
  def change
  	add_column :texts, :emocion, :text
  	add_column :texts, :status, :text
  	remove_column :texts, :analisis, :text
  end
end
