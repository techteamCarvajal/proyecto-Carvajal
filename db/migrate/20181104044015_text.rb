class Text < ActiveRecord::Migration[5.1]
  def change
    create_table :texts do |t|
      t.text :texto
      t.text :analisis
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
