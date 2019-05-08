require "rails_helper"

RSpec.describe Team do
  setup do
    @bulbasaur = Pokemon.new(species: 1, primary_type: "grass", secondary_type: "poison")
    @charmander = Pokemon.new(species: 4, primary_type: "fire")

    #@team_of_two = Team.new(name: "team_of_two_name")
    #@team_of_two.add(@bulbasaur)
    #@team_of_two.add(@charmander)
    load "#{Rails.root}/db/seeds.rb"
  end

  it "can fight if it has at least one pokemon" do
    team = Team.new
    expect(team.can_fight?).to be false
    team.add(@bulbasaur)
    expect(team.can_fight?).to be true
  end

  it "knows if it contains a pokemon of a given species" do
    team = Team.new
    team.add(@bulbasaur)
    expect(team.has_pokemon?(@bulbasaur.species)).to be true
  end

  it "responds to team_efficacy_of" do
    team = Team.new
    expect(team).to respond_to :team_efficacy_of
  end

  it "knows the cumulative efficacy of a particular type against it's pokemon" do
    team = Team.new
    team.add(@bulbasaur)
    expect(team.team_efficacy_of("grass")).to have_efficacy_of(Effect::NOT_VERY_EFFECTIVE, 2)
    team.add(@charmander)
    expect(team.team_efficacy_of("grass")).to have_efficacy_of(Effect::NOT_VERY_EFFECTIVE, 3)
  end

  it "distinguishes between singly and doubly effective/ineffective types" do
    doubly_team = Team.new
    doubly_team.add(@bulbasaur)
    doubly_team_hash = doubly_team.efficacy_hash
    expect(doubly_team_hash[Effect::NOT_VERY_EFFECTIVE]["grass"]).to be 0
    expect(doubly_team_hash[Effect::NOT_VERY_EFFECTIVE / 2]["grass"]).to be 1
  end
end