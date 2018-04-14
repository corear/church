class ChangeHex < ActiveRecord::Migration
  def change
    remove_column :users, :bg
    add_column :users, :bg, :string, :default => "Option 4"
    remove_column :users, :hex
    add_column :users, :hex, :string, :default => "#1ac9c9"
  end
end
