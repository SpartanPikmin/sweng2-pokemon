class AddMove1ToPokemons < ActiveRecord::Migration[5.2]
  def change
    add_column :pokemons, :move1, :string
  end
end
