class CreateTodos < ActiveRecord::Migration[5.0]
  def change
    create_table :todos do |t|
      t.number :project_id
      t.string :text
      t.boolean :isCompleted

      t.timestamps
    end
  end
end
