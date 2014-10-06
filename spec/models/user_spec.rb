require 'rails_helper'

RSpec.describe User, :type => :model do
  
  describe "associations" do

    it "has many mustdos" do
      expect(User.new).to have_many(:mustdos).dependent(:destroy)
    end

  end

end
