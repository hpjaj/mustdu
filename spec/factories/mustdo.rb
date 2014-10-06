FactoryGirl.define do
  factory :mustdo do
    description "This item needs to get done this week"
    user
    complete false
  end
end