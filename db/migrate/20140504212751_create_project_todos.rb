class CreateProjectTodos < ActiveRecord::Migration
  def change
    create_table :project_todos do |t|
      t.string :title
      t.integer :project_id

      t.timestamps
    end
  end
end
