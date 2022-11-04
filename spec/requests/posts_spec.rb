require 'rails_helper'

RSpec.describe 'Author Posts', type: :request do
  describe 'GET /index' do
    @author = Author.first
    @post = Post.first
    id = @author.id
    before(:example) { get author_posts_url(id) }
    it 'responds with code 200' do
      expect(response).to have_http_status(200)
    end

    it 'renders authors list view' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /show' do
    @author = Author.first
    @post = Post.first
    id = @author.id
    post_id = @post.id
    before(:example) { get author_post_url(id, post_id) }
    it 'responds with code 200' do
      expect(response).to have_http_status(200)
    end

    it 'renders authors list view' do
      expect(response).to render_template(:show)
    end
  end
end
