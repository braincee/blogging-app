# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'post_show', type: :feature do
  before(:each) do
    @author = Author.first
    @post = Post.first
    @comment = Comment.first
    visit "/authors/#{@author.id}/posts/#{@post.id}"
  end
  scenario 'can see the post\'s title' do
    expect(page).to have_content(@post.title)
  end
  scenario 'can see the post\'s author name' do
    expect(page).to have_content(@author.name.to_s)
  end
  scenario 'can see the post\'s number of comments' do
    expect(page).to have_content("Comments: #{@post.comments_counter}")
  end
  scenario 'can see the post\'s number of likes' do
    expect(page).to have_content("Likes: #{@post.likes_counter}")
  end
  scenario 'can see the post\'s body' do
    expect(page).to have_content(@post.text)
  end
  scenario 'can see the name of the commentor' do
    expect(page).to have_content(@comment.author.name)
  end
  scenario 'can see the comment\'s text' do
    expect(page).to have_content(@comment.text)
  end
end
