require 'rails_helper'

describe 'User creates a Mustdo list with multiple items' do
  
  # everthing in this before block is redundant from the 
  # user_signs_in_and_out_spec.rb
  # How do I DRY this up?  How can I reference one spec in another?
  # Or how do I create a factory for signing in.
  # I tried using Devise test helpers, and got errors; researched and
  # found out that they should only be used with controller specs
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
end