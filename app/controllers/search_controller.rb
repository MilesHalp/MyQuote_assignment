# Miles Halpine 10607950
# Code based off Workshop 8's search-controller-code_1.txt
# Controller file that handles searching for quotes with the inputted category
class SearchController < ApplicationController
  def index
    # Grabs the category searched by the user
    category_query = params[:category_query]
      # Read operation that returns associated quotes with the category searched
      # Added a filter so only public quotes are viewable
      if category_query.present?
        @quotematch = Quote.joins(:quote_categories, :categories). where("categories.cat_name LIKE ?", "%#{category_query}%").where(is_public: true).distinct
    end    
  end
end
