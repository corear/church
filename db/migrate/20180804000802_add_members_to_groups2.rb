class AddMembersToGroups2 < ActiveRecord::Migration
  def change
    add_column :groups, :members, :integer, array: true, default: []
    add_column :groups, :elders, :integer, array: true, default: []
  end
end
