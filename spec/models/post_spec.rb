# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:the_author) { Author.create!(name: 'Mustard', photo: 'https://via.placeholder.com/150', bio: 'Hello Rails', posts_counter: 0) }
  let(:the_post) do
    Post.new(
      author: the_author,
      title: 'Mustard Title', text: 'Mustard Text',
      comments_counter: 0, likes_counter: 0
    )
  end
  let(:comment2) { Comment.new(author: the_author, post: the_post, text: 'c1') }
  let(:comment2) { Comment.new(author: the_author, post: the_post, text: 'c2') }
  let(:comment3) { Comment.new(author: the_author, post: the_post, text: 'c3') }
  let(:comment4) { Comment.new(author: the_author, post: the_post, text: 'c4') }
  let(:comment5) { Comment.new(author: the_author, post: the_post, text: 'c5') }
  let(:comment6) { Comment.new(author: the_author, post: the_post, text: 'c6') }

  context 'the title of the post validation tests' do
    it 'it should have a value' do
      the_post.title = nil
      expect(the_post).to_not be_valid
    end

    it 'cannot be longer than 250 characters' do
      the_post.title = 'a' * 251
      expect(the_post).to_not be_valid
    end
  end

  context 'post comment counter validation tests' do
    it 'it should have a value' do
      the_post.comments_counter = nil
      expect(the_post).to_not be_valid
    end

    it 'it is a positive integer' do
      the_post.comments_counter = -20.5
      expect(the_post).to_not be_valid
    end

    it 'it accepts only integers' do
      [0, 10].each do |counter|
        the_post.comments_counter = counter
        expect(the_post).to be_valid
      end
    end
  end

  context 'post like counter validation tests' do
    it 'has some value' do
      the_post.likes_counter = nil
      expect(the_post).to_not be_valid
    end

    it 'it should bean a positive integer' do
      the_post.likes_counter = -20.5
      expect(the_post).to_not be_valid
    end

    it 'it accepts only positive integers' do
      [0, 10].each do |counter|
        the_post.likes_counter = counter
        expect(the_post).to be_valid
      end
    end
  end

  context 'recent comments method tests' do
    it 'returns empty list if there is no comments' do
      expect(the_post.recent_comments).to eq []
    end

    it 'it should return only the five most recent comments in the right order' do
      comment2.save!
      comment2.save!
      comment3.save!
      comment4.save!
      comment5.save!
      comment6.save!

      the_post.reload
      actual_comments = the_post.recent_comments.pluck(:text)
      expected_comments = [
        comment6.text,
        comment5.text,
        comment4.text,
        comment3.text,
        comment2.text
      ]
      expect(actual_comments).to eq expected_comments
    end
  end
end
