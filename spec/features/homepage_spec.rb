require 'rails_helper'

feature "HomePage" do 
    scenario "Can see The Global Reading Project on the hompage" do 
      visit "/"
      expect(page).to have_content("The Global Reading Project")
    end

    scenario "Can see a Sign Up link at top of page" do 
        visit "/"
        expect(page).to have_link("Sign Up")
    end

      scenario "Can see a Log In link at top of page" do 
        visit "/"
        expect(page).to have_link("Log In")
      end

      scenario "Can see a link to African-American reads" do 
        visit "/"
        expect(page).to have_link("African-American reads")
      end

      scenario "Can see a link to Caribbean reads" do 
        visit "/"
        expect(page).to have_link("Caribbean reads")
      end

      scenario "Can see a link to East Asian reads" do 
        visit "/"
        expect(page).to have_link("East Asian reads")
      end

      scenario "Can see a link to South and South East Asian reads" do 
        visit "/"
        expect(page).to have_link("South and South East Asian reads")
      end

      scenario "Can see a link to South and Central American reads" do 
        visit "/"
        expect(page).to have_link("South and Central American reads")
      end

      scenario "Can see a link to European reads" do 
        visit "/"
        expect(page).to have_link("European reads")
      end

      scenario "Can see a link to North, South and Central African reads" do 
        visit "/"
        expect(page).to have_link("North, South and Central African reads")
      end

      scenario "Can see a link to West Asian reads" do 
        visit "/"
        expect(page).to have_link("West Asian reads")
      end

      scenario "Can see a link to East and West African reads" do 
        visit "/"
        expect(page).to have_link("East and West African reads")
      end

      scenario "Can see a link to About The Global Reading Project" do 
        visit "/"
        expect(page).to have_link("About The Global Reading Project")
      end

      scenario "Can see a link to Reviews" do 
        visit "/"
        expect(page).to have_link("Reviews")
      end


      scenario "Can see a link to Create Review" do 
        visit "/"
        expect(page).to have_link("Create Review")
      end



      
  end