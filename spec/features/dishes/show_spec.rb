require 'rails_helper'

describe "As a visitor" do
  describe "when I visit a dish's show page" do
    before :each do
      @chef_1 = Chef.create!(name: "Chef Meg")
      @dish_1 = @chef_1.dishes.create!(name: "Shrimp Alfredo", description: "Fettucini Alfredo w/ shrimp")
      
      @ingredient_1 = @dish_1.ingredients.create!(name: "Fettucini", calories: 500)
      @ingredient_2 = @dish_1.ingredients.create!(name: "Alfredo", calories: 600)
      @ingredient_3 = @dish_1.ingredients.create!(name: "Shrimp", calories: 300)
      
      visit "/dishes/#{@dish_1.id}"
    end
    
    it "I see the chef that made the dish and the ingredients" do
      expect(page).to have_content("#{@dish_1.name}")
      expect(page).to have_content("#{@chef_1.name}")
      expect(page).to have_content("#{@ingredient_1.name}")
      expect(page).to have_content("#{@ingredient_2.name}")
      expect(page).to have_content("#{@ingredient_3.name}")
    end
  end
end