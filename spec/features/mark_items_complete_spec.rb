require 'rails_helper'

describe 'User marks items completeled' do
    
    before do
      user = create(:user)
      visit '/'
      click_link 'Sign in'
      visit new_user_session_path
      fill_in 'Enter email', with: user.email
      fill_in 'Enter password', with: user.password
      click_button 'Sign in'
      expect(current_path).to eq mustdos_path(user)
      expect( page ).to have_content(user.name)
      visit new_mustdo_path
      fill_in 'Description', with: 'Meet up with the team'
      click_button 'Save'
      expect( page ).to have_content('Your new Mustdu item was saved')
      expect( page ).to have_content('Meet up with the team') 
      visit new_mustdo_path
      fill_in 'Description', with: 'Buy gift for spouse'
      click_button 'Save'
      expect( page ).to have_content('Your new Mustdu item was saved')
      expect( page ).to have_content('Meet up with the team') 
      expect( page ).to have_content('Buy gift for spouse')
    end

    it 'Successfully' do
      expect( page ).to have_content('Complete')
    end
end