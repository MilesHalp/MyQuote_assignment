# Miles Halpine 10607950
# Edits made are in line with modifications made in Workshop 8, 9 and 10's app-controllers-users_controller.rb.txt
# This controller file handles all the CRUD operations relating to user database entries

class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :require_login, except: [:new, :create] # Before they are logged in, user is only able to load the Log In Form and create a new account

  # GET /users or /users.json
  def index
    # @users = User.all
    # If an admin is logging in, get all of the users from the db
    if logged_in? && is_administrator?
      @users = User.all
    # If a standard user is logging in, redirect them to the standard user home screen
    elsif logged_in? && !is_administrator?
      redirect_to userhome_path
    # Otherwise, notify the user they are unauthorised to access or use a part of the app and send them to the login screen
    else
      flash[:error] = "You are not authorised to access this resource"
      redirect_to login_path
    end
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        # format.html { redirect_to @user, notice: "User was successfully created." }
        format.html { redirect_to login_path, notice: "Sign up successful. Please log in." } # Redirects the user to the Log In Form after they create an account
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to users_path, notice: "User was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    # Password field now set as an allowed parameter
    def user_params
      params.require(:user).permit(:fname, :lname, :email, :password, :is_admin, :status)    
    end
end
