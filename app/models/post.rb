class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments
  has_many :likes

  def update_post_counter
    @author = User.find(author_id)
    if @author.posts_counter
      @author.posts_counter += 1
    else
      @author.posts_counter = 1
    end
    @author.save
  end
end
