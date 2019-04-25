require "rails_helper"

RSpec.describe "creating a pokemon", type: :system do
  it "allows a user to create a new pokemon and give it moves" do
    visit new_pokemon_path
    fill_in "Species", with: "Bulbasaur"
    fill_in "Move_1", with: "Tackle"
    click_on("Create Pokemon")
    expect(page).to have_content("Bulbasaur")
  end
end

RSpec.describe "creating a pokemon without a name", type: :system do
  it "allows a user to create a new pokemon and give it moves" do
    visit new_pokemon_path
    fill_in "Move_1", with: "Tackle"
    click_on("Create Pokemon")
    expect(page).not_to have_content("Bulbasaur")
  end
end
