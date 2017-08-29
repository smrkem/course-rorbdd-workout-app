require 'rails_helper'

RSpec.feature "Creating an exercise" do
  before do
    @user = create(:user)
    login_as(@user)
  end

  scenario "with valid inputs" do
    visit "/"

    click_link "My Lounge"
    click_link "New Workout"
    expect(page).to have_link("Back")

    fill_in "Duration", with: 70
    fill_in "Workout Details", with: "Weight lifting"
    fill_in "Activity Date", with: "2017-01-01"
    click_button "Create Exercise"

    expect(page).to have_content "Exercise has been created"
    exercise = Exercise.last
    expect(current_path).to eq user_exercise_path(@user, exercise)
    expect(exercise.user_id).to eq @user.id
  end
end
