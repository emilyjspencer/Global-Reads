require 'rails_helper'

RSpec.feature "Sign up", type: :feature do 
  scenario "Sign up failure" do 
    visit "/"
    click_link "Sign Up"
    fill_in "Email", with: "bonnies@example.com"
    fill_in "Username", with: "bo"
    fill_in "Password", with: "test123"
    click_button "Sign up"
    expect(page).to have_content("Username is too short (minimum is 4 characters)")
  end
end