require 'rails_helper'
require 'pry'
RSpec.describe User, type: :model do
  subject { User.new name: 'David', photo: 'http://fakeurl.com' }
  before { subject.save }

  it 'Should be not valid when name is empty' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'Should be not valid posts_counter is smaller than 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'should be valid when name is present and posts counter is bigger than 0' do
    subject.name = 'Jorge'
    subject.posts_counter = 1
    expect(subject).to be_valid
  end

  context 'last_three_posts' do
    let(:author_two) { User.new name: 'person', posts_counter: 0 }
    let(:post) { Post.new author_id: author_two.id, title: 'title', comments_counter: 0, likes_counter: 0 }
    let(:post2) { Post.new author_id: author_two.id, title: 'title', comments_counter: 0, likes_counter: 0 }
    let(:post3) { Post.new author_id: author_two.id, title: 'title', comments_counter: 0, likes_counter: 0 }

    it 'should return  3 elements' do
      author_two.save
      post.save
      post2.save
      post3.save
      expect(author_two.last_three_posts.length).to eq(3)
    end
  end
end
