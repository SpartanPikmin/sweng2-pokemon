class CreatePokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons do |t|
      t.references :team, foreign_key: true
      t.string :species
      t.string :primary_type
      t.string :secondary_type

      t.timestamps
    end
  end
end
