require "rails_helper"

RSpec.describe Issue, type: :model do
  it "is valid with valid attributes" do
    user = User.create!(email: "model@test.com", password: "Password123!")
    project = Project.create!(name: "Model Project", description: "Desc")

    issue = Issue.new(
      title: "Bug found",
      description: "Something is broken",
      status: "Open",
      priority: "High",
      user: user,
      project: project
    )

    expect(issue).to be_valid
  end

  it "is invalid without a title" do
    user = User.create!(email: "model2@test.com", password: "Password123!")
    project = Project.create!(name: "Model Project 2", description: "Desc")

    issue = Issue.new(
      title: nil,
      description: "x",
      status: "Open",
      priority: "High",
      user: user,
      project: project
    )

    expect(issue).not_to be_valid
  end
end
