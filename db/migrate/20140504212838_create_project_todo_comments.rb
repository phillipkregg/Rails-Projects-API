class CreateProjectTodoComments < ActiveRecord::Migration
  def change
    create_table :project_todo_comments do |t|
      t.string :comment
      t.integer :project_todo_id

      t.timestamps
    end
  end
end
