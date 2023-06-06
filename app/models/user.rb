class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :comments
  has_many :likes
  # attr_accessor :post_counter
  def last_three_posts
    posts.limit(3).order(created_at: :desc)
  end
end
