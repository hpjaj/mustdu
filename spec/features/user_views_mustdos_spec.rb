require "rails_helper"

feature "User views mustdos" do
  include Warden::Test::Helpers
  Warden.test_mode!

  after { Warden.test_reset! }

  scenario "redirect to login if not logged in" do
    
    visit mustdos_path

    expect(page.current_path).to eq new_user_session_path
    expect(page).to have_content "You need to sign in or sign up before continuing."

  end

  scenario "prompt to create mustdo when list empty" do

    user = create(:user)
    login_as(user, :scope => :user)
    visit mustdos_path

    expect(page).to have_content "You've got no mustdos, why not create one?"

  end

  scenario "list with incomplete mustdos only" do

    user = create(:user)
    
    user.mustdos.create(description: "Get milk", complete: false)
    user.mustdos.create(description: "Pay bills", complete: true)
    user.mustdos.create(description: "Cancel meeting", complete: false)
    login_as(user, :scope => :user)
    visit mustdos_path

    expect(page).to have_content "Get milk"
    expect(page).not_to have_content "Pay bills"
    expect(page).to have_content "Cancel meeting"
  end 

end