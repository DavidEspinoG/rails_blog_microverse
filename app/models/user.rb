class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id

  validates :name, presence: true
  validates :posts_counter, comparison: { greater_than_or_equal_to: 0 }
  validates :email, confirmation: true
  # validates :email_confirmation, presence: true
  def last_three_posts
    posts.order(created_at: :desc).limit(3)
  end
end
