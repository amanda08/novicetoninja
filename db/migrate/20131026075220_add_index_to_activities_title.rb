class AddIndexToActivitiesTitle < ActiveRecord::Migration
  def change
    add_index :activities, [:user_id, :title]
  end
end
