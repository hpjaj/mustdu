require 'rails_helper'

describe 'Registering' do
  it 'creates a new user account' do
    visit '/'
    click_link 'Sign Up'
    visit new_user_registration_path
    fill_in 'Enter name', with: 'John Smith'
    fill_in 'Enter email', with: 'John@example.com'
    fill_in 'Enter password', with: 'password'
    fill_in 'Enter password confirmation', with: 'password'
    click_button 'Sign up'
  end
end