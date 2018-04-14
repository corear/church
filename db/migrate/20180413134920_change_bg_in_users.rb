class ChangeBgInUsers < ActiveRecord::Migration
  def change
    remove_column :users, :bg
    add_column :users, :bg, :string, :default => "bg1"
  end
end
