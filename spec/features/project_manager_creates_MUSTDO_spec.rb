require 'rails_helper'

describe 'Project manager creates Mustdu' do

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
  end
  
  it 'Successfully' do
    visit mustdos_path
    fill_in 'Description', with: 'Meet up with the team'
    click_button 'Save'
    expect( page ).to have_content('Your new Mustdu item was saved')
    expect( page ).to have_content('Meet up with the team')
  end
end