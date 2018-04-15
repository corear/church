class AddVerseToUsers < ActiveRecord::Migration
  def change
    add_column :users, :verse, :string
  end
end
