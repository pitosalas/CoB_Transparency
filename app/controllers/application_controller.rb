class ApplicationController < ActionController::Base
  include SessionsHelper
#   alias_method :current_user, :current_administrator
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path
  end
  helper_method :current_user 
  @first_open = true
  private
 
  def current_user
   @current_user ||= Administrator.find_by(id: session[:administrator_id]) if session[:administrator_id]
  end

#   def current_ability
#     @current_ability ||= Ability.new(current_administrator)
#   end
end
