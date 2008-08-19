# This controller handles the login/logout function of the site.  
class AccountsController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  
  layout 'default'
  # render new.rhtml
  def new
   
  end

  def create
    logout_keeping_session!
    user = User.authenticate(params[:login], params[:password])
    if user
      # Protects against session fixation attacks, causes request forgery
      # protection if user resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset_session
      self.current_user = user
      #@current_user = user
      new_cookie_flag = (params[:remember_me] == "1")
      handle_remember_cookie! new_cookie_flag
      redirect_back_or_default('/')
      flash[:notice] = "Logado com sucesso."
    else
      note_failed_signin
      @login       = params[:login]
      @remember_me = params[:remember_me]
      render :action => 'new'
    end
  end

  def destroy
    logout_killing_session!
    flash[:notice] = "Você deslogou!."
    redirect_back_or_default('/')
  end

protected
  # Track failed login attempts
  def note_failed_signin
    if params[:login].empty?
      flash[:error] = "Um erro occoreu ao logar você como #{params[:login]}"
    else
      flash[:error] = "Um erro occoreu ao logar você como #{params[:login]}"
    end
    logger.warn "Failed login for '#{params[:login]}' from #{request.remote_ip} at #{Time.now.utc}"
  end
end
