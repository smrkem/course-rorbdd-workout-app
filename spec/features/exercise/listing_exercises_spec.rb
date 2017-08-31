require 'rails_helper'

RSpec.feature "Listing Exercises" do
  before do
    @user = create(:user)
    @ex1 = create(:exercise, workout: "exercise bike", duration_in_min: 35, workout_date: Date.today, user: @user)
    @ex2 = create(:exercise, workout: "stair climbing", duration_in_min: 36, workout_date: 2.days.ago, user: @user)
    @ex3 = create(:exercise, workout: "jumping jacks", duration_in_min: 37, workout_date: 8.days.ago, user: @user)

    login_as @user
  end

  scenario "shows user's exercises for last 7 days" do
    visit '/'
    click_link "My Lounge"

    expect(page).to have_content(@ex1.duration_in_min)
    expect(page).to have_content(@ex1.workout)
    expect(page).to have_content(@ex1.workout_date)

    expect(page).to have_content(@ex2.duration_in_min)
    expect(page).to have_content(@ex2.workout)
    expect(page).to have_content(@ex2.workout_date)

    expect(page).not_to have_content(@ex3.duration_in_min)
    expect(page).not_to have_content(@ex3.workout)
    expect(page).not_to have_content(@ex3.workout_date)
  end

  scenario "when no exercises" do
    @user.exercises.delete_all
    visit '/'
    click_link "My Lounge"

    expect(page).to have_content("There are no workouts yet.")

  end
end
