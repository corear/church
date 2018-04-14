class RemovePostTypeFromPost < ActiveRecord::Migration
  def change
    remove_column :posts, :post_type, :string
  end
end
