class Recognition < ActiveRecord::Migration[5.1]
  def change
    create_table :recognitions do |t|
      t.text :image
      t.text :analisis
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
