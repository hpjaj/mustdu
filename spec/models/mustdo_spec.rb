require 'rails_helper'

RSpec.describe Mustdo, :type => :model do

  describe "associations" do

    it "belongs to user" do
      expect(Mustdo.new).to belong_to(:user)
    end

  end

end
