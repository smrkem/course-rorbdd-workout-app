require 'rails_helper'

RSpec.feature "Creating an exercise" do
  before do
    @user = create(:user)
    login_as(@user)

    visit "/"
    click_link "My Lounge"
    click_link "New Workout"
    expect(page).to have_link("Back")
  end

  scenario "with valid inputs" do
    fill_in "Duration", with: 70
    fill_in "Workout Details", with: "Weight lifting"
    fill_in "Activity Date", with: "2017-01-01"
    click_button "Create Exercise"

    expect(page).to have_content "Exercise has been created"
    exercise = Exercise.last
    expect(current_path).to eq user_exercise_path(@user, exercise)
    expect(exercise.user_id).to eq @user.id
  end

  scenario "with invalid inputs" do
    fill_in "Duration", with: "abc"
    fill_in "Workout Details", with: ""
    fill_in "Activity Date", with: ""
    click_button "Create Exercise"

    expect(page).to have_content "Exercise has not been created"
    expect(page).to have_content "Duration in min is not a number"
    expect(page).to have_content "Workout details can't be blank"
    expect(page).to have_content "Activity date can't be blank"
  end
end
