class AddMove2ToPokemons < ActiveRecord::Migration[5.2]
  def change
    add_column :pokemons, :move2, :string
  end
end
