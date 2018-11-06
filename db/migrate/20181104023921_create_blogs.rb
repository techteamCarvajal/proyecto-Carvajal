class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.text :nombre
      t.text :contenido
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
