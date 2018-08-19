class ChangeStuff < ActiveRecord::Migration
  def change
    change_column :groups, :owner, :integer
    remove_index :groups, :name
    add_index :groups, :name, unique: true
  end
end
