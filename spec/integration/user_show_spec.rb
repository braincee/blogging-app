require 'rails_helper'

RSpec.describe 'User Show Page', type: :feature do
  before :each do
    @first_user = User.create(name: 'Steve', bio: 'Full-Stack Developer', posts_counter: 0)

    @post1 = Post.create(title: 'one', text: 'post1', user_id: @first_user.id, comments_counter: 0, likes_counter: 0)
    @post2 = Post.create(title: 'two', text: 'post2', user_id: @first_user.id, comments_counter: 0, likes_counter: 0)
    @post3 = Post.create(title: 'Third', text: 'post3', user_id: @first_user.id, comments_counter: 0, likes_counter: 0)
    @post4 = Post.create(title: 'Fourth', text: 'post4', user_id: @first_user.id, comments_counter: 0, likes_counter: 0)
    @post4.update_post_counter
  end

  it 'can see the the profile image for a user' do
    visit user_path(@first_user)
    expect(page).to have_css("img[alt='profile-image']")
  end

  it "can see the user's username" do
    visit user_path(@first_user)
    expect(page).to have_content 'Steve'
  end

  it 'can see the number of posts for the user' do
    visit user_path(@first_user)
    expect(page).to have_content('Number of posts: 4')
  end

  it "can see the user's bio" do
    visit user_path(@first_user)
    expect(page).to have_content('Full-Stack Developer')
  end

  it "can see the user's first three posts" do
    visit user_path(@first_user)
    expect(@first_user.most_recent_posts.length).to eq(3)
  end

  it "can see a button that lets me view all of a user's posts." do
    visit user_path(@first_user)
    expect(page).to have_link('Steve')
  end

  it "click on User to redirect to user's post's index page" do
    visit user_path(@first_user)
    click_link 'Steve'
    expect(current_path).to eq user_posts_path(@first_user)
  end

  it "click on user's post to redirect to post's show page" do
    visit user_path(@first_user)
    click_link 'Fourth Post'
    expect(current_path).to eq user_post_path(@first_user, @fourth_post)
  end
end
