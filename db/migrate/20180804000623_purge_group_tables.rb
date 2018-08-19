class PurgeGroupTables < ActiveRecord::Migration
  def change
    remove_column :groups, :members
    remove_column :groups, :elders
  end
end
