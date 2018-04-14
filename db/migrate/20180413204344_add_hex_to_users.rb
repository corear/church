class AddHexToUsers < ActiveRecord::Migration
  def change
    add_column :users, :hex, :string, :default => "1ac9c9"
  end
end
