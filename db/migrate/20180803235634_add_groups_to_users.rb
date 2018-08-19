class AddGroupsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :groups, :integer, array:true, default: []
  end
end
