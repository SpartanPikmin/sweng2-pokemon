require "rails_helper"

RSpec.describe Pokemon do
  let(:bulbasaur) { FactoryBot.build_stubbed(:pokemon, :Bulbasaur, :move1_tackle) }
  let(:pikachu) { FactoryBot.build_stubbed(:pokemon, :Pikachu, :move1_tackle) }
  let(:squirtle) { FactoryBot.build_stubbed(:pokemon, :Squirtle, :move1_tackle) }
  let(:sableye) { FactoryBot.build_stubbed(:pokemon, :Sableye, :move1_tackle) }
  let(:pokemon_without_a_species_or_type_or_move1) { FactoryBot.build_stubbed(:pokemon) }
  let(:pokemon_without_a_species) {FactoryBot.build_stubbed(:pokemon, :primary_type_dark, :move1_tackle)}
  let(:pokemon_without_a_species_or_move1) {FactoryBot.build_stubbed(:pokemon, :primary_type_dark)}
  let(:valid_pokemon) {FactoryBot.build_stubbed(:pokemon, :valid_pokemon, :move1_tackle)}

describe "validity" do
    it "without a species is invalid" do
      expect(valid_pokemon).to be_valid
      valid_pokemon.species = nil
      expect(valid_pokemon).not_to be_valid
      valid_pokemon.species = "Fakemon"
    end

    it "non valid type is invalid" do
      expect(valid_pokemon.type_is_valid?).to eq(true)
      valid_pokemon.primary_type = 'FAKE'
      expect(valid_pokemon.type_is_valid?).to eq(false)
      valid_pokemon.primary_type = "ghost"
    end

    it "without a move1 is invalid" do
      expect(valid_pokemon).to be_valid
      valid_pokemon.move1 = nil
      expect(valid_pokemon).not_to be_valid
      valid_pokemon.move1 = "tackle"
    end

    it "without a primary type is invalid" do
      expect(valid_pokemon).to be_valid
      valid_pokemon.primary_type = nil
      expect(valid_pokemon).not_to be_valid
      valid_pokemon.primary_type = "ghost"
    end

    it "with or without a secondary type is valid" do
      expect(valid_pokemon).to be_valid
      valid_pokemon.secondary_type = nil
      expect(valid_pokemon).to be_valid
    end

  end

  describe "pokemon knows" do
    it "the actual efficacy of move types against it" do
    
      expect(pikachu.efficacy_of(:ground)).to be Effect::SUPER_EFFECTIVE
      expect(pikachu.efficacy_of(:flying)).to be Effect::NOT_VERY_EFFECTIVE
    end
  
    it "all of its weaknesses" do
      expect(pikachu).to have_weaknesses :ground
      expect(squirtle).to have_weaknesses :grass, :electric
      expect(sableye).to have_weaknesses :fairy
    end
  
    it "all of its resistances" do
      expect(pikachu).to have_resistances :flying, :steel, :electric
      expect(squirtle).to have_resistances :fire, :steel, :water, :ice
      expect(sableye).to have_resistances :poison
    end

    it "its own type" do 
      expect(pikachu.types_to_s).to eq("electric")
      expect(squirtle.types_to_s).to eq("water")
      expect(sableye.types_to_s).to eq("ghost dark")
    end
  end 
end