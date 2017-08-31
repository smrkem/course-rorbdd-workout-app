require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  it "is invalid without an email" do
    user = FactoryGirl.build(:user, email: nil)
    expect(user).not_to be_valid
  end

  it "is invalid without a password" do
    user = FactoryGirl.build(:user, password: nil)
    expect(user).not_to be_valid
  end

  it "is invalid without a first name" do
    user = FactoryGirl.build(:user, first_name: nil)
    expect(user).not_to be_valid
  end

  it "is invalid without a last name" do
    user = FactoryGirl.build(:user, last_name: nil)
    expect(user).not_to be_valid
  end

  it "returns the full name" do
    user = create(:user)
    expect(user.full_name).to eq "#{user.first_name} #{user.last_name}"
  end
end
