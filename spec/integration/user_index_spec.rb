require 'rails_helper'

RSpec.describe 'Testing user index page', type: :feature do
  describe 'GET index' do
     before(:each) do
         @first_user = User.create(name: 'Steve', bio: 'Full-Stack Developer', posts_counter: 0)
         @second_user = User.create(name: 'Eugene', bio: 'React Developer', posts_counter: 0)
         @second_user = User.create(name: 'Baroka', bio: 'Ruby Developer', posts_counter: 0)
     end

    scenario 'shows the right content' do
      visit users_path
      sleep(5)
      expect(page).to have_content('Display the list of all Users')
    end

     it 'can see the name of all users' do
        visit users_path
        expect(page).to have_content 'Steve'
        expect(page).to have_content 'Eugene'
        expect(page).to have_content 'Baroka'
     end

        it 'See the number of posts each user has written' do
            visit users_path(@first_user)
            expect(page).to have_content 'Number of posts:'
            expect(page).to have_content 'Number of posts:'
            expect(page).to have_content 'Number of posts:'
            
        end

        it 'can see the profile image of the user' do
            visit users_path
            expect(page).to have_css("img[alt='profile-image']")
        end


        scenario "When I click on a user, I am redirected to that user's show page" do
            visit users_path
            click_link 'Steve', match: :first
            expect(current_path).to eq user_path(@first_user.id)
         end
      end
  end