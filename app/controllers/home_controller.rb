# Miles Halpine 10607950
# Edits made are in line with modifications made in Workshop 8 and 9
# Controller file that handles fetching data for the home view
class HomeController < ApplicationController
  def index # Method that only displays public quotes. Limited to the 10 most recently added quotes
    @quotes = Quote.where(is_public: true).order(created_at: :desc).limit(10)
  end

  def uquotes # Method that gets all the quotes associated with a user
    @quotes = Quote.where(user_id: session[:user_id])
  end
end
