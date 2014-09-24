require 'rails_helper'

describe 'Project manager creates Mustdu' do

  include Warden::Test::Helpers
  Warden.test_mode!
  
  before do
    user = create(:user)
    login_as(user, :scope => :user)
  end
  
  it 'Successfully' do
    visit mustdos_path
    fill_in 'Description', with: 'Meet up with the team'
    click_button 'Save'
    expect( page ).to have_content('Your new Mustdu item was saved')
    expect( page ).to have_content('Meet up with the team')
  end
end