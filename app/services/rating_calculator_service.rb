module RatingCalculatorService
  extend self 
  def average(recipe)
    recipe.rankings.average(:rating) 

  end 

end 
