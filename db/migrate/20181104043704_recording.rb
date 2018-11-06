class Recording < ActiveRecord::Migration[5.1]
  def change
    create_table :recordings do |t|
      t.text :texto
      t.text :emocion
      t.integer :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
