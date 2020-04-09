require 'rails_helper'

RSpec.feature "HomePage", type: :feature do 
  scenario "Login failure" do 
    visit "/"
    click_link "Log In"
    fill_in "Email", with: "bonniem1@example.com"
    click_button "Log in"
    expect(page).to have_content("Your email or password was incorrect. Please try again")
  end
end