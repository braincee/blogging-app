require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { Comment.new(text: 'My comment', author_id: 2) }

  before { subject.save }

  it 'should return text is present' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'should return author_id is an integer' do
    subject.author_id = 'Steve'
    expect(subject).to_not be_valid
  end

  it 'should return author_id being valid' do
    subject.author_id = false
    expect(subject).to_not be_valid
  end

  it 'shoul;d return author_id not being valid' do
    subject.author_id = true
    expect(subject).to_not be_valid
  end
end
