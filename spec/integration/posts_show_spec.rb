require 'rails_helper'
RSpec.describe 'Posts show page', type: :feature do
  before(:each) do
    User.destroy_all
    @first_user = User.create(name: 'Steve', bio: 'Full-Stack Developer', posts_counter: 0)
    @second_user = User.create(name: 'Kayline', bio: 'Developer', posts_counter: 0)
    Post.create(title: 'Coming Home', text: 'Hungry', user_id: @first_user.id, likes_counter: 0, comments_counter: 0)
    @comment = Comment.create(text: 'Washing dishes', user: User.first, post: Post.first)
    @comment = Comment.create(text: 'Watching movies', user: User.first, post: Post.first)
    @like = Like.create(user_id: User.first.id, post_id: Post.first.id)
    visit "/users/#{User.first.id}/posts/#{Post.first.id}"
  end
  describe 'Specs for view posts#show' do
    it 'Can see who wrote the post' do
      expect(page).to have_content 'Steve'
    end
    it 'Can see how many comments it has' do
      expect(page).to have_content 'Comments:'
    end
    it 'Can see how many likes it has' do
      expect(page).to have_content 'Likes: 1'
    end
    it 'Can see the post body' do
      expect(page).to have_content 'Hungry'
    end
    it 'Can see the username of each commentor' do
      expect(page).to have_content 'Steve'
    end
    it 'Can see the comment each commentor left' do
      expect(page).to have_content 'Washing dishes'
      expect(page).to have_content 'Watching movies'
    end
  end
end














