require 'rails_helper'

RSpec.describe Post, type: :model do
    @author_1 = Author.new(name: 'Steve', bio: 'Rails Developer', posts_counter: 3)

    subject  do 
         Post.new(author: @author_1, title: 'Ruby', text: 'Practice', likes_counter: 3, comments_counter: 4)
    end

    before { subject.save }

    it 'should return title is nil' do 
        subject.title = nil
        expect(subject).to_not be_valid
    end

    it 'should return a max of 250 characters' do
        subject.title = "Gloria"
        expect(subject).to_not be_valid
    end

    it 'should return likes counter as integer' do
        subject.likes_counter = "seven"
        expect(subject).to_not be_valid
    end

    it 'should return comments_counter must be >=0' do
    subject.comments_counter = -4
    expect(subject).to_not be_valid
   end

  it 'should return likes_counter must be >=0' do
    subject.likes_counter = -2
    expect(subject).to_not be_valid
  end

   it 'should return zero post comment' do
      recent_comments = 0
      expect(subject.recent_comments.count).to eql(recent_comments)
    end

      it 'should return comments < 5 ' do
      value = subject.recent_comments.length
      expect(value).to be < 5
    end
end