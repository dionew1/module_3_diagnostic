require 'rails_helper'

feature "User can visit root page" do
  scenario "and view navbar contents" do
    visit "/"
    within(".navbar") do
      expect(page).to have_content("AltFuelFinder")
      expect(page).to have_selector("input[value='Search by zip...']")
    end
  end

  scenario "and get search results" do
    visit "/"
    fill_in "q", with: 80203
    click_on "Locate"

    expect(current_path).to eq "/search"
    expect(stations.count).to eq 10
    expect(page).to have_selector "name"
    expect(page).to have_selector "address"
    expect(page).to have_selector "fuel_types"
    expect(page).to have_selector "distance"
    expect(page).to have_selector "access_times"
  end
end



# As a user
# When I visit "/"
# And I fill in the search form with 80203
# And I click "Locate"
# Then I should be on page "/search" with parameters visible in the url
# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
