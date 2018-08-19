class ChangeMembersInGroups < ActiveRecord::Migration
  def change
    remove_column :groups, :members
    add_column :groups, :members, :integer, array:true, default: []
    remove_column :groups, :admins
    add_column :groups, :admins, :integer, array:true, default: []
  end
end
