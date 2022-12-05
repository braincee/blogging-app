require 'rails_helper'

RSpec.describe Author, type: :model do
  the_user = Author.new(
    name: 'Mustard',
    photo: 'https://via.placeholder.com/150',
    bio: 'Some text as bio!',
    posts_counter: 0
  )

  context 'the name of the author validation tests' do
    it 'it should have a value' do
      the_user.name = nil
      expect(the_user).to_not be_valid
    end

    it 'it should not be blank' do
      the_user.name = '    '
      expect(the_user).to_not be_valid
    end

    it 'accepts a string' do
      the_user.name = 'Mustard'
      expect(the_user).to be_valid
    end
  end

  context 'the authors post counter tests' do
    it 'it should have a value' do
      the_user.posts_counter = nil
      expect(the_user).to_not be_valid
    end

    it 'it is a positive integer' do
      the_user.posts_counter = -20.5
      expect(the_user).to_not be_valid
    end

    it 'it acccepts only integers' do
      [0, 10].each do |counter|
        the_user.posts_counter = counter
        expect(the_user).to be_valid
      end
    end
  end

  context 'the most recent posts method tests' do
    let(:the_author) { Author.create!(name: 'Mustard', photo: 'https://via.placeholder.com/150', bio: 'bio', posts_counter: 0) }
    let(:post1) do
      Post.new(title: 'post 1', author: the_author, text: 'Hello Rails', comments_counter: 0, likes_counter: 0)
    end
    let(:post2) do
      Post.new(title: 'post 2', author: the_author, text: 'Hello Rails', comments_counter: 0, likes_counter: 0)
    end
    let(:post3) do
      Post.new(title: 'post 3', author: the_author, text: 'Hello Rails', comments_counter: 0, likes_counter: 0)
    end
    let(:post4) do
      Post.new(title: 'post 4', author: the_author, text: 'Hello Rails', comments_counter: 0, likes_counter: 0)
    end

    it 'if author has no post then it should return nothing' do
      posts_count = the_author.most_recent_posts.count
      expect(posts_count).to be 0
    end

    it 'if author has more than 3 posts, it should return the latest 3 postsyyy' do
      post2.save!
      post3.save!
      post4.save!
      posts = the_author.most_recent_posts
      posts_count = posts.count
      titles = posts.pluck(:title)
      expect(posts_count).to be 3
      expect(titles).to eq [post4.title, post3.title, post2.title]
    end
  end
end
