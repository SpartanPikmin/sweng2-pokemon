require "rails_helper"

RSpec.describe Pokemon do
  setup do
    @pikachu = Pokemon.new(species: 25, primary_type: "electric")
    @squirtle = Pokemon.new(species: 7, primary_type: "water")
    load "#{Rails.root}/db/seeds.rb"
  end
  it "expects a pokemon to be created with a species" do
    pokemon = Pokemon.new(species: 1)
    expect(pokemon.species).not_to be_nil
  end

  it "can account for a pokemon with no data yet defined"  do
    pokemon = Pokemon.new
    expect(pokemon.species).to be_nil
    expect(pokemon.types).to be_nil
  end

  it "responds to efficacy_of" do
    expect(@pikachu).to respond_to :efficacy_of
  end

  it "knows the actual efficacy of move types against it" do
    expect(@pikachu.efficacy_of("ground")).to be Effect::SUPER_EFFECTIVE
    expect(@pikachu.efficacy_of("flying")).to be Effect::NOT_VERY_EFFECTIVE
  end

  it "knows all of its weaknesses" do
    expect(@pikachu).to have_weaknesses "ground"
    expect(@squirtle).to have_weaknesses "grass", "electric"
  end

  it "knows all of its resistances" do
    expect(@pikachu).to have_resistances "flying", "steel", "electric"
    expect(@squirtle).to have_resistances "fire", "steel", "water", "ice"
  end
end
