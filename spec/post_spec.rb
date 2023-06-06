require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.new name: 'David', posts_counter: 0 }
  let(:subject) { Post.new author_id: user.id }
  let(:post2) { Post.new author_id: user.id }
  let(:post3) { Post.new author_id: user.id }
  let(:post4) { Post.new author_id: user.id }
  let(:post5) { Post.new author_id: user.id }
  let(:post6) { Post.new author_id: user.id }
  let(:post7) { Post.new author_id: user.id }
  before do
    user.save
    subject.save
  end
  it 'Sholuld be invalid when title is blank' do
    subject.title = nil
    expect(subject).to_not be_valid
  end
  it 'Should be invalid when title is bigger than 250' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end
  it 'Should be invalid when comments_counter is smaller than zero' do
    subject.title = 'aasfasf'
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end
  it 'Should be invalid when likes_counter is smaller than zero' do
    subject.title = 'aasfasf'
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  context 'update_post_counter' do 
    it 'should increment posts_counter by one' do 
      expect(subject.update_post_counter.posts_counter).to eq(user.posts_counter + 1)
    end
  end

  context 'five_most_recent_comments' do 
    it 'should return maximum five elements' do
      post2.save
      post3.save
      post4.save
      post5.save
      post6.save
      post7.save
      expect(subject.five_most_recent_comments.length).to be <= 5
    end
  end

end
