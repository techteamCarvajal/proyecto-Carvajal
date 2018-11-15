class AddSalarioToOffers < ActiveRecord::Migration[5.1]
  def change
    add_column :offers, :salario, :float
  end
end
