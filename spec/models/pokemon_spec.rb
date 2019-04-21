require "rails_helper"

RSpec.describe Pokemon do
  it "expects a pokemon to be created with a species" do
    pokemon = Pokemon.new(species: 1)
    expect(pokemon.species).not_to be_nil
  end

  it "can account for a pokemon with no data yet defined"  do
    pokemon = Pokemon.new
    expect(pokemon.species).to be_nil
    expect(pokemon.types).to be_nil
  end
end
