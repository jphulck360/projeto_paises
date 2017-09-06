class CreateCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :countries do |t|
      t.string :localizacao
      t.string :capital
      t.integer :extensao
      t.string :idioma
      t.integer :populacao
      t.float :pib
      t.string :moeda
      t.integer :ano_referencia

      t.timestamps
    end
  end
end
