json.array!(@project_todos) do |project_todo|
  json.extract! project_todo, :id, :title, :project_id
  json.url project_todo_url(project_todo, format: :json)
end
