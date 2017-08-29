require 'rails_helper'

RSpec.feature "Visiting the Home Page" do
  scenario "A user visits the home page" do
    visit "/"

    expect(page).to have_link('Athletes Den')
    expect(page).to have_link('Home')
    within ".jumbotron" do
        expect(page).to have_content('Workout Lounge!')
        expect(page).to have_content('Show off your workout')
    end
  end
end
