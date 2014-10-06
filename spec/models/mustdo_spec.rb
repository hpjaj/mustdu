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

  describe "default scope" do

    it "orders by created at ascending (oldest first, newest last)" do

      middle = nil
      travel -2.days do
        middle = create(:mustdo)
      end

      oldest = nil
      travel -3.days do
        oldest = create(:mustdo)
      end

      newest = nil
      travel -1.day do
        newest = create(:mustdo)
      end

      mustdos = Mustdo.all
      expect(mustdos).to eq([oldest, middle, newest])
      expect(mustdos[0].created_at).to be < mustdos[1].created_at
      expect(mustdos[1].created_at).to be < mustdos[2].created_at
    end

  end

end
