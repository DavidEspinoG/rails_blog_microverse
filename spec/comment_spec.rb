require 'rails_helper'
RSpec.describe Comment, type: :model do
  let!(:author) { User.create name: 'person', posts_counter: 0 }
  let!(:post) { Post.create author_id: author.id, title: 'title', comments_counter: 1, likes_counter: 0 }
  let!(:comment) { Comment.create author_id: author.id, post_id: post.id }

  context 'update_comment_counter' do
    it 'should increment comments_couter by one' do
      expect(comment.update_comment_counter.comments_counter).to eq(2)
    end
  end
end
