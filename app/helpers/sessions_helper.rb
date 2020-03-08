module SessionsHelper

  # Logs in the given user.
  def log_in(administrator)
    session[:administrator_id] = administrator.id
  end

    # Remembers a user in a persistent session.
  def remember(administrator)
    administrator.remember
    cookies.permanent.encrypted[:administrator_id] = administrator.id
    cookies.permanent[:remember_token] = administrator.remember_token
  end
  # Returns the user corresponding to the remember token cookie.
  def current_administrator
    if (administrator_id = session[:administrator_id])
      @current_administrator ||= Administrator.find_by(id: administrator_id)
    elsif (administrator_id = cookies.encrypted[:administrator_id])
      administrator = Administrator.find_by(id: administrator_id)
      if administrator && administrator.authenticated?(cookies[:remember_token])
        log_in administrator
        @current_administrator = administrator
      end
    end
  end

   # Returns true if the user is logged in, false otherwise.
   def logged_in?
    !current_administrator.nil?
  end
    # Logs out the current user.
    def log_out
      session.delete(:administrator_id)
      @current_administrator = nil
    end

    # Forgets a persistent session.
  def forget(administrator)
    administrator.forget
    cookies.delete(:administrator_id)
    cookies.delete(:remember_token)
  end

  # Logs out the current user.
  def log_out
    forget(current_administrator)
    session.delete(:administrator_id)
    @current_administrator = nil
  end
end
