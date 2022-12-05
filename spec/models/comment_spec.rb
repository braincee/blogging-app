require 'rails_helper'

RSpec.describe Comment, type: :model do
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

  context 'comments created update the post comments conter' do
    it 'returns 0 if there is no comments' do
      expect(the_post.comments_counter).to eq 0
    end

    it 'it should return only the five most recent comments in the right order' do
      comment2.save!
      comment2.save!
      comment3.save!
      comment4.save!
      comment5.save!
      comment6.save!

      the_post.reload
      expect(the_post.comments_counter).to eq 6
    end
  end
end
