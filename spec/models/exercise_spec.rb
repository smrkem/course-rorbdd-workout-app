require 'rails_helper'

RSpec.describe Exercise, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:exercise)).to be_valid
  end

  it "is invalid without a user" do
    user = build(:exercise, user: nil)
    expect(user).not_to be_valid
  end

  it "is invalid without a duration" do
    user = build(:exercise, duration_in_min: nil)
    expect(user).not_to be_valid
  end

  it "is invalid without a date" do
    user = build(:exercise, workout_date: nil)
    expect(user).not_to be_valid
  end

  it "is invalid without a workout name" do
    user = build(:exercise, workout: nil)
    expect(user).not_to be_valid
  end
end
