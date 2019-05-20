require "rails_helper"

RSpec.describe Team do
  let(:charmander) {build(:pokemon, species: 4, primary_type: "fire")}
  let(:bulbasaur) {build(:pokemon, species: 1, primary_type: "grass", secondary_type: "poison")}
  let(:empty) {build_stubbed(:team)}
  let(:bulbasaur_team) {build_stubbed(:team, pokemon: [bulbasaur])}

  it "can fight if it has at least one pokemon" do
    team = empty
    expect(team.can_fight?).to be false
    team.add(charmander)
    expect(team.can_fight?).to be true
  end

  it "knows if it contains a pokemon of a given species" do
    team = bulbasaur_team
    expect(team.has_pokemon?(bulbasaur.species)).to be true
  end

  it "responds to team_efficacy_of" do
    team = empty
    expect(team).to respond_to :team_efficacy_of
  end

  it "knows the cumulative efficacy of a particular type against it's pokemon" do
    team = bulbasaur_team
    expect(team.team_efficacy_of(:grass)).to have_efficacy_of(Effect::NOT_VERY_EFFECTIVE, 2)
    team.add(charmander)
    expect(team.team_efficacy_of(:grass)).to have_efficacy_of(Effect::NOT_VERY_EFFECTIVE, 3)
  end

  it "distinguishes between singly and doubly effective/ineffective types" do
    doubly_team = bulbasaur_team
    doubly_team_hash = doubly_team.efficacy_hash
    expect(doubly_team_hash[Effect::NOT_VERY_EFFECTIVE][:grass]).to be 0
    expect(doubly_team_hash[Effect::NOT_VERY_EFFECTIVE / 2][:grass]).to be 1
  end

#  it "responds to perform and returns 42" do
#    team = empty
#    expect(team.perform(BigDependency.new)).to be 42
#  end

  it "runs fast when given a fake object" do
    team = empty
    expect(team.perform(FakeBigDependency.new)).to be 42
  end 

  it "runs fast when given a BigDependency double" do
    team = empty
    big_dependency_double = double()
    allow(big_dependency_double).to receive(:execute)
    expect(big_dependency_double).to receive(:execute)
    expect(team.perform(big_dependency_double)).to be 42
  end 

  it "runs fast when given a spy"  do
    team = empty
    big_dependency = spy('big_dependency')
    allow(big_dependency).to receive(:execute)
    expect(team.perform(big_dependency)).to be 42
    expect(big_dependency).to have_received(:execute)
  end
end

