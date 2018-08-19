class AddMembersToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :members, :string, array:true, default: []
  end
end
