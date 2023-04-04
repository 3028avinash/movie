class ApplicationController < ActionController::Base
  before_action :current_user

    helper_method :current_user
    def current_user
      if session[:user_id]
        @current_user ||= User.find(session[:user_id])
      else
      @current_user = nil
      end
    end

  def require_user_login!
    redirect_to sign_in_path, alert: "Must be Log In" if @current_user.nil?
  end

   

end
