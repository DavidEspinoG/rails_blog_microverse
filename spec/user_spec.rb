require 'rails_helper'

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
end
