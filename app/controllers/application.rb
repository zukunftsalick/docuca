# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'e701bbd0ef7585060409a406d7340e53'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  include AuthenticatedSystem
  
  helper_method :is_admin?
  def is_admin? 
    if logged_in? && current_user.login == "admin"
      true
    else
      false
    end
  end

  def admin_required
    is_admin? || admin_denied
  end

  def admin_denied
    respond_to do |format|
      format.html do
        store_location
        flash[:notice] = 'You must be an admin to do that.'
        redirect_to home_path
      end
    end
  end
  
  
  
end
