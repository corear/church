class AddBgToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bg, :string
  end
end
