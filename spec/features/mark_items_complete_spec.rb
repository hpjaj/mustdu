require 'rails_helper'

describe 'User marks items completeled' do
    
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
      expect( page ).to have_content('Complete')
      check("mustdo[complete]")
      checkbox = find('#mustdo_complete')
      expect( checkbox ).to be_checked

      mustdo_element = find(".colored-rows")
      expect(mustdo_element).to_not be_visible
      # this one below is a test.  it should not be passing
      # but it is.  meaning the item is not being deleted
      expect( page ).to have_content('Meet up with the team') 
      
      # i will uncomment this one, below, once above does not work
      #expect( page ).to_not have_content('Meet up with the team')

    end
end