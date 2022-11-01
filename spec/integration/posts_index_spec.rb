require 'rails_helper'
RSpec.describe Post, type: :model do
  describe 'For the Post model' do
    before(:each) do
      @first_user = User.create(name: 'Steve', bio: 'Full-Stack Developer', posts_counter: 0)
      @post = Post.create(user: @first_user, title: 'Coming Home', text: 'Sleep', likes_counter: 7,
                          comments_counter: 5)
    end
    before { @post.save}
     it "Shows user's name" do
      @first_user.name = 'Steve'
      expect(@first_user).to be_valid
    end
    it "shows user's profile picture" do
    all('img') do |i|
      expect(i[:alt]).to eq('profile-image')
    end
  end
   it "shows some of the post's body" do
    @post.text = 'Sleep'
    expect(@post).to be_valid
  end
   it 'shows the first comment on a post' do
    @post.text = 'Sleep'
    expect(@post).to be_valid
  end
    it 'if there is max 250 characters' do
      @post.title = 'Coming Home'
      expect(@post).to be_valid
    end
    it 'can see how many likes a post has ' do
      @post.likes_counter = 7
      expect(@post).to be_valid
    end
    it 'can see how many comments a post has' do
      @post.comments_counter = 5
      expect(@post).to be_valid
    end
    feature 'Post index' do
      background { visit users_path }
      it 'shows a section for pagination if there are more posts than fit on the view.' do
      expect(page).to have_content 'Pagination'
    end
      it "click on user's post should redirect to post's show page" do
        visit user_path(@post.id)
    click_link 'Coming Home', match: :first
    expect(current_path).to eq user_post_path(@first_user, @post)
    end
    end
  end
end