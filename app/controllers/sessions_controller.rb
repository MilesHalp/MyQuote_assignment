# Miles Halpine 10607950
# Code from Workshop 9's SessionsController_code.txt
# This controller file authenticates the user's login and logout
class SessionsController < ApplicationController
    # New method renders the login form
    def new
    end 

    # Create method checks if the user's login information is in the database and their account is flagged as active.
    # If user info is correct and account is active, user details are stored and they are sent to their corresponding path, depending on if they are an admin or standard user
    # If user info is incorrect and/or account is not active, an error appears
    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password]) && user.status == "Active"
            session[:user_id] = user.id
            session[:fname] = user.fname
            session[:is_admin] = user.is_admin

            if session[:is_admin]
                redirect_to admin_path, notice: "Logged in successfully!"
            else
                redirect_to userhome_path, notice: "Logged in successfully!"
            end
        else
            # Edited the error the inform the user that their account may not be active
            flash.now[:error] = "Invalid email or password. Please try again. Account may not be active"
            render 'new'
        end
    end

    # Destroy method effectively functions as the log out method, removing all the stored user details and sends them back to the home screen
    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "Logged out successfully!"
    end
end
