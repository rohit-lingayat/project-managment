class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.timestamps
      t.belongs_to :project, index: true
      t.belongs_to :user, index: true
      t.string :task
      t.string :status
    end
  end
end
