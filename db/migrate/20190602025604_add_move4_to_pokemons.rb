class AddMove4ToPokemons < ActiveRecord::Migration[5.2]
  def change
    add_column :pokemons, :move4, :string
  end
end
