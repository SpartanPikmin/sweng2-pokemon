require "rails_helper"

RSpec.describe Team do
    it "can't fight if it has no pokemon" do
        team = Team.new
        expect(team.can_fight?).to be false
    end

    it "can fight if it has at least one pokemon" do
        team = Team.new
        bulbasaur = Pokemon.new(1)
        team.add(bulbasaur)
        expect(team.can_fight?).to be true
    end
end
