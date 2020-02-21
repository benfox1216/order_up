class ChefIngredientsController < ApplicationController
  def index
    @dishes = Chef.find(params[:chef_id]).dishes
    
    # This was the beginning of my attempt to do this with a joins, as my
    # current solution could have duplicates:
    
    # ingredients = Ingredients.joins(:dishingredients).where(ingredients.id)
  end
end