require "rails_helper"

RSpec.describe Pokemon do
  let(:bulbasaur) { FactoryBot.build(:pokemon, species: 1) }
  let(:pikachu) { FactoryBot.build(:pokemon, species: 25, primary_type: "electric") }
  let(:squirtle) { FactoryBot.build(:pokemon, species: 7, primary_type: "water") }
  let(:sableye) { FactoryBot.build(:pokemon, primary_type: "ghost", secondary_type: "dark") }
  let(:no_species) { FactoryBot.build(:pokemon) }

  it "expects a pokemon to be created with a species" do
    expect(bulbasaur.species).not_to be_nil
  end

  it "can account for a pokemon with no data yet defined"  do
    expect(no_species.species).to be_nil
    expect(no_species.types).to be_nil
  end

  it "responds to efficacy_of" do
    expect(pikachu).to respond_to :efficacy_of
  end

  it "knows the actual efficacy of move types against it" do
    expect(pikachu.efficacy_of(:ground)).to be Effect::SUPER_EFFECTIVE
    expect(pikachu.efficacy_of(:flying)).to be Effect::NOT_VERY_EFFECTIVE
  end

  it "knows all of its weaknesses" do
    expect(pikachu).to have_weaknesses :ground
    expect(squirtle).to have_weaknesses :grass, :electric
    expect(sableye).to have_weaknesses :fairy
  end

  it "knows all of its resistances" do
    expect(pikachu).to have_resistances :flying, :steel, :electric
    expect(squirtle).to have_resistances :fire, :steel, :water, :ice
    expect(sableye).to have_resistances :poison
  end

#  it "does a thing slow" do
#    dependency = BigDependency.new
#    expect(pikachu.perform(dependency)).to be 42
#  end

  it "does a thing fast" do
    fake = FakeBigDependency.new
    expect(pikachu.perform(fake)).to be 42
  end

  it "does a thing fast using a stub" do
    fake = double()
    allow(fake).to receive(:execute)
    expect(pikachu.perform(fake)).to be 42
  end

  it "does a thing fast using a mock" do
    fake = double()
    expect(fake).to receive(:execute)
    allow(fake).to receive(:execute)
    expect(pikachu.perform(fake)).to be 42
  end
end
