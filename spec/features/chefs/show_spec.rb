require 'rails_helper'

describe "As a visitor" do
  describe "when I visit a chef's show page" do
    before :each do
      @chef_1 = Chef.create!(name: "Chef Meg")
      @chef_2 = Chef.create!(name: "Chef Mike")
      
      @dish_1 = @chef_1.dishes.create!(name: "Shrimp Alfredo", description: "Fettucini Alfredo w/ shrimp")
      @dish_2 = @chef_2.dishes.create!(name: "Chicken Alfredo", description: "Fettucini Alfredo w/ chicken")
      
      @ingredient_1 = @dish_1.ingredients.create!(name: "Fettucini", calories: 500)
      @ingredient_2 = @dish_1.ingredients.create!(name: "Alfredo", calories: 600)
      @ingredient_3 = @dish_1.ingredients.create!(name: "Shrimp", calories: 300)
      @ingredient_4 = @dish_2.ingredients.create!(name: "Chicken", calories: 250)
      
      DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingredient_1.id)
      DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingredient_2.id)
      
      visit "/chefs/#{@chef_2.id}"
    end
    
    it "I see the name of the chef and a link to their chef ingredients index page" do
      expect(page).to have_content("#{@chef_2.name}")
      click_link "All Ingredients Used"
      expect(current_path).to eq("/chefs/#{@chef_2.id}/ingredients")
      
      expect(page).to have_content("Ingredients Used")
      expect(page).to have_content("#{@ingredient_1.name}")
      expect(page).to have_content("#{@ingredient_2.name}")
      expect(page).to have_content("#{@ingredient_4.name}")
    end
  end
end