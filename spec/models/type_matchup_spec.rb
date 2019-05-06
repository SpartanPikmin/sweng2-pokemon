require 'rails_helper'

RSpec.describe TypeMatchup, type: :model do
  setup do
    TypeMatchup.create(target: "normal", source: "fighting", efficacy: 200)
  end
  it "responds properly to efficacy" do
    matchup = TypeMatchup.find_by(target: "normal", source: "fighting")
    expect(matchup.efficacy).to be 200
  end
end
