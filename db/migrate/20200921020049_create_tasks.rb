class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :task_id
      t.integer :user_id
      t.integer :category_id
      t.integer :sublist_id
      t.integer :future_proof_id
      t.text :task
      t.integer :priority_level
      t.string :solidifier
      t.boolean :completed
      t.boolean :global

      t.timestamps
    end
  end
end
