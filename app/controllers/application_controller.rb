# Miles Halpine 10607950
# Controller that acts as the parent for all other controllers
class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern # User requires an up-to-date web browser to access the web app

  # Helper methods that can be accessed by child controllers
  helper_method :current_user, :logged_in?, :is_administrator?

  # Method that loads the user's account details
  def current_user
        @current_user ||= User.find_by(id: session[:user_id])
  end

  # Method that checks if a user is logged in
  def logged_in?
        !current_user.nil?
  end

  # Method that checks if the logged-in user is an admin
  def is_administrator?
        session[:is_admin]
  end

# Methods past this point are private, thus they cannot be accessed outside of ApplicationController
private

  # Method that checks if the user is logged in. If not, they are unable to perform that action or access that controller
  def require_login
    unless logged_in?
    flash[:error] = "You are not permitted to access this resource"
    redirect_to login_path
    end
  end
end
