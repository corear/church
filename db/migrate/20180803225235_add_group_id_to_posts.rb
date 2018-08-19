class AddGroupIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :groupid, :integer
  end
end
