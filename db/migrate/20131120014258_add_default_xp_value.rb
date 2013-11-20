class AddDefaultXpValue < ActiveRecord::Migration
  def change
  	change_column :activities, :xp, :integer, default: 1
  end
end