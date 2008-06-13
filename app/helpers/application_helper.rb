# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def user_logged_in?
    session[:user_id]
  end
  

  
end
