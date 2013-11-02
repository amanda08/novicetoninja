class AddContributionsTable < ActiveRecord::Migration
  def up
    drop_table :activities_goals

    create_table :contributions do |t|
      t.integer :goal_id
      t.integer :activity_id
      t.timestamps
    end
    add_index :contributions, :goal_id
    add_index :contributions, :activity_id
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
