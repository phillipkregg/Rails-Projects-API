json.array!(@project_todo_comments) do |project_todo_comment|
  json.extract! project_todo_comment, :id, :comment, :project_todo_id
  json.url project_todo_comment_url(project_todo_comment, format: :json)
end
