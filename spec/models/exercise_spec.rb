require 'rails_helper'

RSpec.describe Exercise, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:exercise)).to be_valid
  end

  it "is invalid without a user" do
    exercise = build(:exercise, user: nil)
    expect(exercise).not_to be_valid
  end

  it "is invalid without a duration" do
    exercise = build(:exercise, duration_in_min: nil)
    expect(exercise).not_to be_valid
  end

  it "is invalid if duration is not a number" do
    exercise = build(:exercise, duration_in_min: "abc")
    expect(exercise).not_to be_valid
  end

  it "is invalid without a date" do
    exercise = build(:exercise, workout_date: nil)
    expect(exercise).not_to be_valid
  end

  it "is invalid without a workout name" do
    exercise = build(:exercise, workout: nil)
    expect(exercise).not_to be_valid
  end

  it "should return exercises for last 7 days" do
    (1..6).each do |n|
      create(:exercise, workout: "Exercise #{n}", workout_date: n.days.ago)
    end
    ex7 = create(:exercise, workout: "Exercise 7", workout_date: 8.days.ago)

    expect(Exercise.all.count).to eq 7
    expect(Exercise.for_last_week.count).to eq 6
    expect(Exercise.for_last_week.include?(ex7)).to eq false
  end
end
