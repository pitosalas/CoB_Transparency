class SessionsController < ApplicationController
  def new
  end

  def create
    administrator = Administrator.find_by(email: params[:session][:email].downcase)
    if administrator && administrator.authenticate(params[:session][:password])
      if administrator.activated?
        log_in administrator
        params[:session][:remember_me] == '1' ? remember(administrator) : forget(administrator)
        redirect_back_or '/admin'
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to login_path
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
