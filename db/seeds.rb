user = User.first || User.create!(email: "demo@example.com", password: "Password123!")
p1 = Project.find_or_create_by!(name: "TasteTrail App", description: "Food discovery app")
Issue.find_or_create_by!(title: "Map not loading", description: "Tile layer fails", status: "Open", priority: "High", project: p1, user: user)
Issue.find_or_create_by!(title: "Login bug", description: "JWT expiry", status: "In Progress", priority: "Medium", project: p1, user: user)
