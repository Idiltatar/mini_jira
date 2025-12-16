require "rails_helper"

RSpec.describe "Projects", type: :system do
  it "allows a logged-in user to create a project" do
    User.create!(email: "test@example.com", password: "Password123!")

    visit new_user_session_path
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "Password123!"
    click_button "Log in"

    click_link "New Project"
    fill_in "Name", with: "Mini Jira Demo"
    fill_in "Description", with: "Created by system test"
    click_button "Create Project"

    expect(page).to have_content("Mini Jira Demo")
  end
end
