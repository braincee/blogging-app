require 'rails_helper'

RSpec.describe 'show author tests', type: :feature do
  describe 'test for author show' do
    before(:example) do
      @author = Author.first
      @post = Post.first
      visit '/'
    end

    scenario 'I can see the author profile picture.' do
      first('.author_link').click
      page.has_selector?('img')
    end

    scenario 'I can see the number of posts ' do
      first('.author_link').click
      expect(page).to have_content("Number of posts: #{@author.posts_counter}")
    end

    scenario 'I can see the user username.' do
      first('.author_link').click
      expect(page).to have_content(@author.name.to_s)
    end

    scenario 'I can see user bio ' do
      first('.author_link').click
      expect(page).to have_content(@author.bio.to_s)
    end

    scenario 'When I click to see one post, it redirects me to that post.' do
      first('.author_link').click
      first('.single_post').click
      expect(page.current_path).to eql("/authors/#{@author.id}/posts/#{@post.id}")
    end

    scenario 'When I click to see all posts, it redirects me to the authors posts index page.' do
      first('.author_link').click
      first('.link').click
      expect(page.current_path).to eql("/authors/#{@author.id}/posts")
    end
  end
end
