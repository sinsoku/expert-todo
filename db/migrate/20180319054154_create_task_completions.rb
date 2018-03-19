class CreateTaskCompletions < ActiveRecord::Migration[5.2]
  def change
    create_table :task_completions do |t|
      t.references :task, foreign_key: true, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
