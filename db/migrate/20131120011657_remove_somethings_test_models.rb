class RemoveSomethingsTestModels < ActiveRecord::Migration
  def up
    drop_table :somethings
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
