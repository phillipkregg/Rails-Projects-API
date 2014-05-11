class ProjectTodoComment < ActiveRecord::Base
  attr_accessible :comment, :project_todo_id
  belongs_to :project_todo
end
