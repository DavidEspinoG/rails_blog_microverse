class RenameAuthorColumnInPosts < ActiveRecord::Migration[7.0]
  def change
    rename_column('posts', 'author_id_id', 'user_id')
  end
end
