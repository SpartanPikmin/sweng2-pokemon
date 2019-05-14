require "rails_helper"

RSpec.describe Matchups do
  it "works" do
    expect(Matchups.efficacy_of(source: :normal, target: [:normal])).to be 100
  end
end
