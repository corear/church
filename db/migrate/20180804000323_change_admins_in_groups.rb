class ChangeAdminsInGroups < ActiveRecord::Migration
  def change
    remove_column :groups, :admins
    add_column :groups, :elders, :integer, array:true, default: []
  end
end
