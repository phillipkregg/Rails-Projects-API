class ProjectTodo < ActiveRecord::Base
  attr_accessible :project_id, :title
  belongs_to :project
  has_many :project_todo_comments
end
