require 'rails_helper'

RSpec.describe do
  let!(:author) { User.create name: 'person', posts_counter: 0 }
  let!(:post) { Post.create author_id: author.id, title: 'title', comments_counter: 0, likes_counter: 0 }
  let!(:like) { Like.create author_id: author.id, post_id: post.id }
  context 'update_likes_counter' do
    it 'should increment likes_counter by one' do
      expect(like.update_likes_counter.likes_counter).to eq(2)
    end
  end
end
