require "rails_helper"

RSpec.describe Team do
  it "can't fight if it has no pokemon" do
    team = Team.new
    expect(team.can_fight?).to be false
  end

  it "can fight if it has at least one pokemon" do
    team = Team.new
    bulbasaur = Pokemon.new(species: 1)
    expect(team.can_fight?).to be false

    team.add(bulbasaur)
    expect(team.can_fight?).to be true
  end
end
