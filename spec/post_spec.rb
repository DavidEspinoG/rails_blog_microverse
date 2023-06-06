require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.new name: 'David', posts_counter: 0 }
  let(:subject) { Post.new author_id: user.id }
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
end
