class AddMove3ToPokemons < ActiveRecord::Migration[5.2]
  def change
    add_column :pokemons, :move3, :string
  end
end
