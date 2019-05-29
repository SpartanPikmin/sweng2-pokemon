require "rails_helper"

RSpec.describe "creating a pokemon", type: :system do
  it "allows a user to create a new pokemon and give it moves" do
    visit new_pokemon_path
    fill_in "Species", with: "Bulbasaur"
    fill_in "Move_1", with: "Tackle"
    fill_in "Primary type", with: "Grass"
    click_on("Create Pokemon")
    expect(page).to have_content("Bulbasaur")
  end
end

RSpec.describe "creating a pokemon without a name", type: :system do
  it "allows a user to create a new pokemon and give it moves" do
    visit new_pokemon_path
    fill_in "Move_1", with: "Tackle"
    click_on("Create Pokemon")
    expect(page).to have_text("prohibited pokemon must have a name and primary type")
  end
end

RSpec.describe "creating a pokemon with a name but no primary type", type: :system do
  it "doesn't allow the user to make a pokemon with out a primary type" do 
    visit new_pokemon_path
    fill_in "Move_1", with: "Lick"
    fill_in "Species", with: "Gastly"
    click_on("Create Pokemon")
    expect(page).to have_text("prohibited pokemon must have a name and primary type")
  end
end


