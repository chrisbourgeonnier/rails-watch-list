class RemoveMovieIdFromBookmarks < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookmarks, :movie_id, :integer
  end
end
