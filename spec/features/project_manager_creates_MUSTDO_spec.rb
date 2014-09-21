require 'rails_helper'

describe 'Project manager creates MUSTDO' do
  it 'Successfully' do
    visit new_mustdo_path
    fill_in 'Description', with: 'Meet up with the team'
    click_button 'Save'
    expect( page ).to have_content('Your new Mustdu item was saved')
    expect( page ).to have_content('Meet up with the team')
  end
end