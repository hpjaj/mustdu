require "rails_helper"

feature "User creates mustdo" do
  include Warden::Test::Helpers
  Warden.test_mode!

  after { Warden.test_reset! }

  scenario "shows error for invalid description" do

    too_short_description = "2sml"

    sign_in_and_view_mustdos
    fill_in "mustdo[description]", with: too_short_description
    click_button "Save"

    expect(current_path).to eq(mustdos_path)
    expect(page).to have_content "Description is too short (minimum is 5 characters)"
    expect(page).to have_content "You've got no mustdos, why not create one?"
  end

  scenario "displays new mustdo in list" do

    sign_in_and_view_mustdos
    fill_in "mustdo[description]", with: "Remember the milk or else"
    click_button "Save"

    expect(current_path).to eq(mustdos_path)
    expect(page).to have_content "Remember the milk or else"
    expect(page).not_to have_content "You've got no mustdos, why not create one?"
  end

  def sign_in_and_view_mustdos
    user = create(:user)
    login_as(user, scope: :user)
    visit mustdos_path
  end


end