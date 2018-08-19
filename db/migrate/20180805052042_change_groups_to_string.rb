class ChangeGroupsToString < ActiveRecord::Migration
  def change
    remove_column :users, :groups
    add_column :users, :groups, :string, :default => ""
    remove_column :groups, :members
    add_column :groups, :members, :string, :default => ""
    remove_column :groups, :elders
    add_column :groups, :elders, :string, :default => ""
  end
end
