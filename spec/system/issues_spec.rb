require "rails_helper"

RSpec.describe "Issues", type: :system do
  it "allows a logged-in user to create an issue inside a project" do
    user = User.create!(email: "test@example.com", password: "Password123!")
    project = Project.create!(name: "Test Project", description: "Desc")

    login_as(user, scope: :user)

    visit new_project_issue_path(project)

    find("#issue_title").set("Login button broken")
    find("#issue_description").set("Button does nothing")

    select "Open", from: "issue_status"
    select "High", from: "issue_priority"
    select user.email, from: "issue_user_id"

    click_button "Create Issue"

    expect(page).to have_content("Issue created successfully").or have_content("Issue created")
    expect(page).to have_content("Login button broken")
  end
end
