require 'rails_helper'

describe 'User marks items completed', :js => true do
    
    before do
      user = create(:user)
      visit '/'

      within '.pull-right' do
        click_link 'Sign In'
      end

      visit new_user_session_path
      fill_in 'Enter email', with: user.email
      fill_in 'Enter password', with: user.password
      click_button 'Sign in'
      expect(current_path).to eq mustdos_path
      expect( page ).to have_content(user.name)
      visit new_mustdo_path
      fill_in 'Description', with: 'Meet up with the team'
      click_button 'Save'
      expect( page ).to have_content('Meet up with the team') 
      visit mustdos_path
    end

    it 'Successfully' do
      expect( page ).to have_content('Meet up with the team')
      check("mustdo[complete]")
      expect( page ).to_not have_content('Meet up with the team')
    end
end
