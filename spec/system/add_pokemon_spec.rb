require "rails_helper"

RSpec.describe "creating a team", type: :system do
  it "allows a user to create a new team" do
    visit new_team_path
    fill_in "Name", with: "Cool Team"
    click_on "Create Team"
    expect(page).to have_content("Cool Team")
  end
end

RSpec.describe "creating a pokemon", type: :system do
	it "allows a user to create a new pokemon and give it moves" do
		visit new_pokemon_path
		fill_in "Species", with: "Bulbasaur"
		fill_in "Move_1", with: "Tackle"
		click_on("Create Pokemon")
		expect(page).to have_content("Bulbasaur")
	end
end
