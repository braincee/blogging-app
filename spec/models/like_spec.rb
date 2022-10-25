require 'rails_helper'

RSpec.describe Like, type: :model do
  subject { Like.new(author_id: 3, post_id: 5) }

  before { subject.save }

  it 'should return author_id is present' do
    subject.author_id = false
    expect(subject).to_not be_valid
  end

  it 'should return author id be an integer' do
    subject.author_id = 'Steve'
    expect(subject).to_not be_valid
  end

  it 'should return if post_id is present' do
    subject.post_id = nil
    expect(subject).to_not be_valid
  end

  it 'Should post id be an integer' do
    subject.post_id = 'Gloria'
    expect(subject).to_not be_valid
  end
end
