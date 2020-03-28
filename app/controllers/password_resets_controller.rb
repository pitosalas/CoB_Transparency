class PasswordResetsController < ApplicationController
  before_action :get_administrator,   only: [:edit, :update]
  before_action :valid_administrator, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]    # Case (1)

  def new
  end

  def create
    @administrator = Administrator.find_by(email: params[:password_reset][:email].downcase)
    if @administrator
      @administrator.create_reset_digest
      @administrator.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions"
      redirect_to login_path
    else
      flash.now[:danger] = "Email address not found"
      render 'new'
    end
  end

  def edit
  end

  def update
    if params[:administrator][:password].empty?                  # Case (3)
      @administrator.errors.add(:password, "can't be empty")
      render 'edit'
    elsif @administrator.update(administrator_params)                     # Case (4)
      log_in @administrator
      flash[:success] = "Password has been reset."
      redirect_to '/admin'
    else
      render 'edit'                                     # Case (2)
    end
  end
  private
  def administrator_params
    params.require(:administrator).permit(:password, :password_confirmation)
  end
  def get_administrator
    @administrator = Administrator.find_by(email: params[:email])
  end

  # Confirms a valid user.
  def valid_administrator
    unless (@administrator && @administrator.activated? &&
            @administrator.authenticated?(:reset, params[:id]))
      redirect_to '/admin'
    end
  end
    # Checks expiration of reset token.
    def check_expiration
      if @administrator.password_reset_expired?
        flash[:danger] = "Password reset has expired."
        redirect_to new_password_reset_url
      end
    end
end
