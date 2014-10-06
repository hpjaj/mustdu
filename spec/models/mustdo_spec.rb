require 'rails_helper'

RSpec.describe Mustdo, :type => :model do

  describe "associations" do

    it "belongs to user" do
      expect(Mustdo.new).to belong_to(:user)
    end

  end

  describe "validations" do

    it "ensures description is at least 5 characters" do
      expect(Mustdo.new).to ensure_length_of(:description).is_at_least(5)
    end

  end

end
