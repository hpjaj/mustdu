require 'rails_helper'

describe 'Once user has an account' do
  it 'user signs in and out' do
    user = create(:user)
    mustdo = create(:mustdo)
    visit '/'
    click_link 'Sign in'
    visit new_user_session_path
    fill_in 'Enter email', with: user.email
    fill_in 'Enter password', with: user.password
    click_button 'Sign in'
    expect(current_path).to eq mustdos_path(user)
    expect( page ).to have_content(user.name)
    click_link 'Sign out'
    visit '/'
    expect( page ).to_not have_content(user.name)
  end

end