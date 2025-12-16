require "rails_helper"

RSpec.describe "Projects", type: :request do
  let(:user) { User.create!(email: "req@test.com", password: "Password123!") }

  it "redirects guests to login" do
    get projects_path
    expect(response).to redirect_to(new_user_session_path)
  end

  it "allows logged-in users to create a project" do
    sign_in user

    expect {
      post projects_path, params: { project: { name: "Req Project", description: "From request spec" } }
    }.to change(Project, :count).by(1)

    expect(response).to redirect_to(project_path(Project.last))
  end
end
