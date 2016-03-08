class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :content, :default => "デフォルト値"
      t.datetime :due_at, :default => Time.zone.now
      t.datetime :remind_at
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :tasks, [:user_id, :due_at]
  end
end
