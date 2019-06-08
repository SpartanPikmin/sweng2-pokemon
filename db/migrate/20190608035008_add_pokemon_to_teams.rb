class AddPokemonToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :pokemon1, :integer
	add_column :teams, :pokemon2, :integer
	add_column :teams, :pokemon3, :integer
	add_column :teams, :pokemon4, :integer
	add_column :teams, :pokemon5, :integer
	add_column :teams, :pokemon6, :integer
  end
end
