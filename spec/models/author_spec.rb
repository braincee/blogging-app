require 'rails_helper'

RSpec.describe Author, type: :model do
  subject { Author.new(name: 'Steve', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Rails Develper', posts_counter: 3) }

  before { subject.save }

  it 'name should not be blank' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'post counter should be an integer' do
    subject.posts_counter = 'Steve'
    expect(subject).to_not be_valid
  end

  it 'should return post counter must be >=0' do
    subject.posts_counter = -2
    expect(subject).to_not be_valid
  end 

  it 'should return posts less than 5' do
    total_posts = subject.most_recent_posts.length
    expect(total_posts).to be < 5
  end

  it 'should return zero author posts' do
    expected_posts = 0
    expect(subject.most_recent_posts.count).to eq(expected_posts)
  end

  it 'should return posts < 5' do
      value = subject.most_recent_posts.length
      expect(value).to be < 5
  end
end
