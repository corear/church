class AddAdminsToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :admins, :string, array:true, default: []
  end
end
