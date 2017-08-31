FactoryGirl.define do
  factory :exercise do
    duration_in_min 1
    workout "MyText"
    workout_date "2017-08-30"
    association(:user)
  end
end
