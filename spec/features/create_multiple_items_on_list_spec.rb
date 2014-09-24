require 'rails_helper'

describe 'User creates a Mustdo list with multiple items' do
  
  include Warden::Test::Helpers
  Warden.test_mode!

  before do
    user = create(:user)
    login_as(user, :scope => :user)
  end

  it 'Successfully' do
    visit new_mustdo_path
    2.times { create(:mustdo) }
  end
end