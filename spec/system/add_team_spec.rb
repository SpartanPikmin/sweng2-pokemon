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
    visit new_team_path
    fill_in "Name", with: "Team with Pokemon"
    fill_in "Pokemon 1", with: "Articuno"
    fill_in "Pokemon 2", with: "Zapdos"
    fill_in "Pokemon 3", with: "Moltres"
    click_on "Create Team"
    expect(page).to have_content("Team with Pokemon")
    expect(page).to have_content("Articuno")
    expect(page).to have_content("Zapdos")
    expect(page).to have_content("Moltres")
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
