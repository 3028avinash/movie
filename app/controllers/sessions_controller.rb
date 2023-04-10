class SessionsController < ApplicationController
  def new
  end

  def index
  end

  def create
      user = User.find_by(email: params[:email])

      if user.present? && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_url, notice: "Log In !"
      else
        flash.now[:alert] = "Email or Password is Invalid"
        render "new"
      end
  end

  def destroy
    session[:user_id]=nil
    redirect_to root_url, notice: "Log Out!"
  end


end
