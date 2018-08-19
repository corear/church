class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.text :description
      t.string :owner

      t.timestamps null: false
    end
    add_index :groups, :name
    add_index :groups, :owner
  end
end
