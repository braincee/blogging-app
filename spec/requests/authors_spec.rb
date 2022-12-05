# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Authors', type: :request do
  describe 'GET /index' do
    before(:example) { get authors_path }
    it 'responds with code 200' do
      expect(response).to have_http_status(200)
    end

    it 'renders authors list view' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /show' do
    @author = Author.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                         posts_counter: 0)
    @post = Post.new(author: @author, title: 'Hello', text: 'This is my first post', likes_counter: 0,
                     comments_counter: 0)
    @comment = Comment.create(text: 'Welcome', author: @author, post: @post)
    @author.save
    @post.save
    @comment.save
    id = @author.id
    before(:example) { get author_path(id) }
    it 'responds with code 200' do
      expect(response).to have_http_status(200)
    end

    it 'renders authors list view' do
      expect(response).to render_template(:show)
    end
  end
end
