class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id

  validates :name, presence: true
  validates :posts_counter, comparison: { greater_than: -1 }
  def last_three_posts
    posts.order(created_at: :desc).limit(3)
  end
end
