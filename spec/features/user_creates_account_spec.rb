require 'rails_helper'

describe 'Registering' do
  it 'creates a new user account' do
    
    visit '/'

    within '.pull-right' do
        click_link 'Sign Up'
    end

    visit new_user_registration_path
    fill_in 'Enter name', with: 'John Smith'
    fill_in 'Enter email', with: 'John@example.com'
    fill_in 'Enter password', with: 'password'
    fill_in 'Enter password confirmation', with: 'password'
    click_link 'Sign Up'
  end

end