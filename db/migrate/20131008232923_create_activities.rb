class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.integer :user_id
      t.string :description
      t.string :link
      t.integer :xp

      t.timestamps
    end
  end
end
