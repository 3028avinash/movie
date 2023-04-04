class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]


  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params) 
    if @user.save
      redirect_to users_path
    else
      flash.now[:alert] = @user.errors.full_messages
      render "new"
    end
  end

  def edit
  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session[:user_id]=nil
    redirect_to root_url, notice: "Log Out! and User Deleted "
    # respond_to do |format|
    #   format.html { redirect_to users_url, notice: "User was successfully destroyed." }
    #   format.json { head :no_content }
    # end
  end



  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "user was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  

  private

  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:name, :email,:password, :password_confirmation)
  end


end
