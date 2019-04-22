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
end
