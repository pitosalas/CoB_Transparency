class AccountActivationsController < ApplicationController

    def edit
      administrator = Administrator.find_by(email: params[:email])
      if administrator && !administrator.activated? && administrator.authenticated?(:activation, params[:id])
        administrator.update_attribute(:activated,    true)
        administrator.update_attribute(:activated_at, Time.zone.now)
        log_in administrator
        flash[:success] = "Account activated!"
        redirect_to '/admin'
      else
        flash[:danger] = "Invalid activation link"
        redirect_to login_path
      end
    end
  end