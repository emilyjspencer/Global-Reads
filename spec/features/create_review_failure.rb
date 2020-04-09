require 'rails_helper'

RSpec.feature "Create review failure ", type: :feature do 
  scenario "User can't create a review if the review is less than 20 characters" do 
    visit "/"
    click_on "Create Review"
    fill_in "Title", with: "Pride"
    fill_in "Review", with: "I didn't enjoy"
    click_button "Create Review" 
    expect(page).to have_content("Review is too short (minimum is 20 characters)")
  end

  scenario "User can't create a review if the title is less than 4 characters" do 
    visit "/"
    click_on "Create Review"
    fill_in "Title", with: "1"
    fill_in "Review", with: "I really enjoyed this book because I could relate to the main character Evie"
    click_button "Create Review" 
    expect(page).to have_content("Title is too short (minimum is 4 characters)")
  end
end