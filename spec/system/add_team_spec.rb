require "rails_helper"

RSpec.describe "creating a team", type: :system do
  it "allows a user to create a new team" do
    visit new_team_path
    fill_in "Name", with: "Cool Team"
    click_on "Create Team"
    expect(page).to have_content("Cool Team")
  end

  it "doesn't allow a team with no name" do
    visit new_team_path
    fill_in "Name", with: ""
    click_on "Create Team"
    expect(page).to have_selector(".new_team")
  end

  it "allows a user to create pokemon together with a new team" do
    visit new_pokemon_path
    fill_in "Species", with: "Bulbasaur"
    fill_in "Primary type", with: "Grass"
    fill_in "Move1", with: "tackle"
    click_on("Create Pokemon")
	
	visit new_team_path
	fill_in "Name", with: "Team with Pokemon"
    select('Bulbasaur', :from => 'teams[pokemon][]')
    click_on "Create Team"
    expect(page).to have_content("Team with Pokemon")
  end
  
  it "doesn't allow a user to create a duplicate team" do
    visit new_team_path
    fill_in "Name", with: "Cool Team"
    click_on "Create Team"
    expect(page).to have_content("Cool Team")
	
	visit new_team_path
    fill_in "Name", with: "Cool Team"
    click_on "Create Team"
    expect(page).to have_selector(".new_team")
  end
end

