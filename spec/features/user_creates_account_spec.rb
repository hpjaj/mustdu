require 'rails_helper'

describe 'New user account' do
  it 'creates a new user account' do
    visit '/'
    click_link 'Sign Up'
    visit new_user_registration_path
    fill_in 'Name', with: 'John Smith'
  end
end