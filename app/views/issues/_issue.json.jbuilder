json.extract! issue, :id, :title, :description, :status, :priority, :project_id, :user_id, :created_at, :updated_at
json.url issue_url(issue, format: :json)
