# Miles Halpine 10607950
# Edits made are in line with modifications made in Workshop 10's app-controllers-recipes_controller.erb.txt
# Controller file that manages CRUD operations for the database quotes entries
class QuotesController < ApplicationController
  before_action :set_quote, only: %i[ show edit update destroy ]
  # User can only access the index and show methods if they are not logged in
  before_action :require_login, except: [:index, :show]
  # GET /quotes or /quotes.json
  def index
    # Only gets the logged-in user's quotes when accessing 'My Quotes'
    @quotes = current_user.quotes 
  end

  # GET /quotes/1 or /quotes/1.json
  def show
  end

  # GET /quotes/new
  def new
    @quote = Quote.new
    # Builds the eight category fields for the form
    8.times { @quote.quote_categories.build }
  end

  # GET /quotes/1/edit
  def edit
    (8 - @quote.quote_categories.size).times { @quote.quote_categories.build }
  end

  # POST /quotes or /quotes.json
  def create
    @quote = Quote.new(quote_params)

    respond_to do |format|
      if @quote.save
        format.html { redirect_to @quote, notice: "Quote was successfully created." }
        format.json { render :show, status: :created, location: @quote }
      else
        # Rebuilds the eight category fields if validation error occurs
        (8 - @quote.quote_categories.size).times { @quote.quote_categories.build }
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotes/1 or /quotes/1.json
  def update
    respond_to do |format|
      if @quote.update(quote_params)
        format.html { redirect_to @quote, notice: "Quote was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @quote }
      else
        @quote.quote_categories.reload
        (8 - @quote.quote_categories.size).times { @quote.quote_categories.build }
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1 or /quotes/1.json
  def destroy
    # Authorisation check so that only the quote's creator or an admin can delete the quote
    unless @quote.user.id == current_user.id || is_administrator?
      redirect_to @quote, alert: "You are not authorised to access this resource"
      return
    end
    @quote.destroy!

    respond_to do |format|
      format.html { redirect_to your_quotes_path, notice: "Quote was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def quote_params
      params.require(:quote).permit(:quote_text, :pub_year, :user_comment, :is_public, :user_id, :philosopher_id, quote_categories_attributes: [:id, :category_id])
    end
end
