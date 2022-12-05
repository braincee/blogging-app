require 'rails_helper'
RSpec.describe 'post_index', type: :feature do
  describe 'test for author show' do
    before(:example) do
      @author = Author.first
      @post = Post.first
      visit "/authors/#{@author.id}/posts"
    end
    scenario 'shows the user\'s profile picture' do
      page.has_selector?('img')
    end
    scenario 'can see the user\'s username' do
      expect(page).to have_content(@author.name.to_s)
    end
    scenario 'can see the user\'s number of posts' do
      expect(page).to have_content("Number of posts: #{@author.posts_counter}")
    end
    scenario 'can see the post\'s title' do
      expect(page).to have_content(@post.title)
    end
    scenario 'can see the post\'s body' do
      expect(page).to have_content(@post.text)
    end
    scenario 'can see the post\'s comments' do
      page.has_selector?('comments')
    end
    scenario 'can see the post\'s number of comments' do
      expect(page).to have_content("Comments: #{@post.comments_counter}")
    end
    scenario 'can see the post\'s number of likes' do
      expect(page).to have_content("Likes: #{@post.likes_counter}")
    end
    scenario 'can see a section for pagination' do
      expect(page).to have_content('Pagination')
    end
    scenario 'redirects to the post\'s page when a post is clicked' do
      first('.link').click
      expect(page.current_path).to eql("/authors/#{@author.id}/posts/#{@post.id}")
    end
  end
end
