class ChangePostCounterDataType < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :posts_counter, :integer, using: 'posts_counter::integer'
  end
end
