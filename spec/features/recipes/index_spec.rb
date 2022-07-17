require 'rails_helper'

RSpec.describe "recipes index page" do 
   it "has the name/complexity/genre of each recipe" do 
      italian = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
      greek = Recipe.create!(name: "Gyro", complexity: 3, genre: "Greek")
      thai = Recipe.create!(name: "Panang Curry", complexity: 4, genre: "Thai")

      visit "/recipes"

      within "#recipes-#{italian.id}" do
         expect(page).to have_content("Name: Spaghetti")
         expect(page).to have_content("Complexity: 2")
         expect(page).to have_content("Genre: Italian")
      end 

      within "#recipes-#{greek.id}" do
         expect(page).to have_content("Name: Gyro")
         expect(page).to have_content("Complexity: 3")
         expect(page).to have_content("Genre: Greek")
      end 

      within "#recipes-#{thai.id}" do
         expect(page).to have_content("Name: Panang Curry")
         expect(page).to have_content("Complexity: 4")
         expect(page).to have_content("Genre: Thai")
      end 
   end 
end

