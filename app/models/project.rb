class Project < ActiveRecord::Base
  attr_accessible :title
  has_many :project_todos
end
