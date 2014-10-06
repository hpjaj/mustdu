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

  describe "scopes" do

    describe "default" do

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

    describe "incomplete" do

      it "queries for records where complete is false" do
        complete_mustdo = create(:mustdo, complete: true)
        incomplete_mustdo = create(:mustdo, complete: false)
        expect(Mustdo.incomplete).to eq([incomplete_mustdo])
      end

    end

  end

  describe "#days_left" do
    
    after(:each) do
      travel_back
    end

    it "is 0 after 1 week" do
      travel_to Time.now
      mustdo = create(:mustdo)
      travel 1.week
      expect(mustdo.days_left).to eq(0)
    end

    it "is 7 for the first day" do
      
      travel_to Time.now
      mustdo = create(:mustdo)
      expect(mustdo.days_left).to eq(7)

      half_day = 12.hours
      travel (half_day)
      
      expect(mustdo.days_left).to eq(7)
      
      travel 1.second
      expect(mustdo.days_left).to eq(6)
    end

    it "rounds to the nearest half day" do
      created_at = Time.now
      travel_to created_at
      
      mustdo = create(:mustdo)
      expect(mustdo.days_left).to eq(7)

      (0..6).each do |days_passed|
        travel_to created_at + (days_passed + 0.5).days
        expected_days_left = 7 - days_passed
        expect(mustdo.days_left).to eq(expected_days_left)
        travel 1.second
        expect(mustdo.days_left).to eq(expected_days_left - 1)
      end

    end
  end

end
