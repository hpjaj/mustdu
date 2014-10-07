require "rails_helper"

feature "User creates mustdo" do
  include Warden::Test::Helpers
  Warden.test_mode!

  after { Warden.test_reset! }

  scenario "shows error for invalid description" do

    user = create(:user)
    login_as(user, scope: :user)
    visit mustdos_path

    too_short_description = "2sml"
    fill_in "mustdo[description]", with: too_short_description
    click_button "Save"

    expect(current_path).to eq(mustdos_path)
    expect(page).to have_content "Description is too short (minimum is 5 characters)"
    expect(page).to have_content "You've got no mustdos, why not create one?"
  end


end