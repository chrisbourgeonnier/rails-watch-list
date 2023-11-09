class RemoveListIdFromBookmarks < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookmarks, :list_id, :integer
  end
end
