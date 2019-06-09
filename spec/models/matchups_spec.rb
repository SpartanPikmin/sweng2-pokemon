require "rails_helper"

RSpec.describe Matchups do

  describe "efficiancy_of" do
  
    it "provides a valid answer when given one type" do
      expect(Matchups.efficacy_of(source: :normal, target: [:normal])).to be 100
      expect(Matchups.efficacy_of(source: :fighting, target: [:normal])).to be 200
      expect(Matchups.efficacy_of(source: :ground, target: [:water])).to be 100
    end

    it "provides a valid answer when given two types" do
      expect(Matchups.efficacy_of(source: :normal, target: [:normal,:fairy])).to be 100
      expect(Matchups.efficacy_of(source: :fighting, target: [:flying,:rock])).to be 100
      expect(Matchups.efficacy_of(source: :fighting, target: [:rock,:steel])).to be 400
    end
  end

  describe "multiply_efficacies" do
    it "multiplies all values in a table into one value" do
      expect(Matchups.multiply_efficacies([100])).to be 100
      expect(Matchups.multiply_efficacies([350])).to be 350
      expect(Matchups.multiply_efficacies([200,200])).to be 400
      expect(Matchups.multiply_efficacies([200,50])).to be 100
    end
  end
end
