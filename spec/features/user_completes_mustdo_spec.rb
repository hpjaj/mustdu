require 'rails_helper'

feature 'User completes mustdo', :js => true do
  include Warden::Test::Helpers
  Warden.test_mode!

  after { Warden.test_reset! }

  scenario 'hides completed mustdo' do

    user = create(:user)
    user.mustdos.create! description: "Meet up with the team"
    login_as(user, :scope => :user)
    visit mustdos_path

    expect( page ).to have_content('Meet up with the team')
    check("mustdo[complete]")
    expect( page ).to_not have_content('Meet up with the team')
  end
end
