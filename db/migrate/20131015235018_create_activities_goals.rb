class CreateActivitiesGoals < ActiveRecord::Migration
  def change
    create_table :activities_goals do |t|
      t.integer :goal_id
      t.integer :activity_id
    end
    add_index :activities_goals, :goal_id
    add_index :activities_goals, :activity_id
  end
end
