class UsersController < ApplicationController
  def index
    @user = User.all
  end
  def show
    @user = User.find(params[:id])
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save 
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to login_path
      #log_in @administrator
      #flash[:success] = "Welcome to the CoB Transparency Project"
      #redirect_to '/admin'
      #redirect_to @administrator
    else
      render 'new'
    end
  end
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :access_code)
    end
end
