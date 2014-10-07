require "rails_helper"

feature "User views mustdos" do

  scenario "redirects to login if not logged in" do
    
    visit mustdos_path

    expect(page.current_path).to eq new_user_session_path
    expect(page).to have_content "You need to sign in or sign up before continuing."
    
  end

end